require "thor"
module SwissAdmin
  module Commands
    class Network < Thor
      namespace :network
      class_option :format, :aliases => "-f", :desc => "Format the output", :default => "text"

      desc "ip_addresses", "All the ip addresses on this host"
      def ip_addresses
        Formatter.output(SwissAdmin::Network::IP.addresses, options[:format])
      end

      desc "first_ipv4", "First ipv4 interface"
      def first_ipv4
        Formatter.output(SwissAdmin::Network::IP.first_ipv4, options[:format])
      end
    end
  end
end

