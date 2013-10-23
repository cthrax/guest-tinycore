module VagrantPlugins
    module TinyCorePlugin
        module Cap
            class MountvirtualBoxSharedFolder
                def self.mount_virtualbox_shared_folder(machine, name, guestpath, options)
                    expanded_guest_path = machine.guest.capability(:shell_expand_guest_path, guestpath)

                    mount_options = "-o uid=`id -u #{options[:owner]}`,gid=`getent group #{options[:group]} | cut -d: -f3`"

                    if options[:mount_options]
                        mount_options += ",#{options[:mount_options].join(",")}"
                    end

                    mount_command = "mount -t vboxsf #{mount_options} #{name} #{expanded_guest_path}"

                    machine.communicate.sudo("mkdir -p #{expanded_guest_path}")

                    #Attempt to mount the folder, Retry a few times because it can fail early on
                    attempts = 0
                    while true
                        success = true
                        machine.communicate.sudo(mount_command) do |type, data|
                            success = false if type == :stderr && data =~ /No such device/i
                        end

                        break if success

                        attempts += 1
                        raise Vagrant::Errors::LinuxMountFailed, :command => mount_command
                        sleep 2
                    end

                    # Chown the directory to the proper user
                    machine.communicate.sudo(
                        "chown `id -u #{optiosn[:owner]}`:`getent group #{options[:group
