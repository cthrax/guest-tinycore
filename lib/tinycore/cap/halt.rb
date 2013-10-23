module VagrantPlugins
    module TinyCorePlugin
        module Cap
            class Halt
                def self.halt(machine)
                     begin
                         machine.communicate.sudo("poweroff")
                     rescue IOError
                         # Do Nothing, because it probably means the machine shutdown and SSH connection was lost.
                     end
                end
            end
        end
    end
end

