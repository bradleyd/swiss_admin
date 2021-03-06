require "thor"
module SwissAdmin
  module Commands
    class Network < Thor
      namespace :network

      desc "ip_addresses", "All the ip addresses on this host"
      def ip_addresses
        $stdout.puts SwissAdmin::Network.ip_addresses
      end

      desc "first_ipv4", "First ipv4 interface"
      def first_ipv4
        $stdout.puts SwissAdmin::Network.first_ipv4 
      end
    end
  end
end

