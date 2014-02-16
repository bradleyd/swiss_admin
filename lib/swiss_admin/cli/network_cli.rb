require "thor"
module SwissAdmin
  class Network < Thor
    desc "ip_addresses", "All the ip addresses on this host"
    def ip_addresses
      $stdout.puts SwissAdmin::Host.ip_addresses
    end

    desc "first_ipv4", "First ipv4 interface"
    def first_ipv4
      $stdout.puts SwissAdmin::Host.first_ipv4 
    end
  end
end

