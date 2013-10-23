require 'vagrant'

module VagrantPlugins
 module GuestTinyCore
    class Plugin < Vagrant.plugin("2")
        name "Tiny Core Guest Plugin"

        guest "TinyCore", "linux" do
          require_relative "guest"
          Guest
        end

        #guest_capability(os, "change_host_name") do
        #    require_relative "cap/change_host_name"
        #    Cap::ChangeHostName
        #end

        #guest_capability(os, "configure_networks") do
        #    require_relative "cap/configure_networks"
        #    Cap::ConfigureNetworks
        #end

        guest_capability("TinyCore", "halt") do
            require_relative "cap/halt"
            Cap::Halt
        end
    end
 end
end
