require 'socket'

module SwissAdmin
  class Network
    def self.ip_addresses
      Socket.ip_address_list.map { |i| {ip_address: i.ip_address, name: i.getnameinfo} }
    end

    def self.first_ipv4
      Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address
    end
  end
end
