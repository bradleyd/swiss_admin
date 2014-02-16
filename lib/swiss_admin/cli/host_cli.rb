require "thor"
module SwissAdmin
  class Host < Thor
    desc "name", "Hostname"
    def name
      $stdout.puts SwissAdmin::Host.name
    end

    desc "ip_addresses", "All the ip addresses on this host"
    def ip_addresses
      $stdout.puts SwissAdmin::Host.ip_addresses
    end

    desc "cpus", "Number of cpu's"
    def cpus
      $stdout.puts SwissAdmin::Host.cpus
    end

    desc "first_ipv4", "First ipv4 interface"
    def first_ipv4
      $stdout.puts SwissAdmin::Host.first_ipv4 
    end
  end
end

