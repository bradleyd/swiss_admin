require 'socket'

module SwissAdmin
  module Network
    class IP
    def self.addresses
      addrs = Socket.ip_address_list.map { |i| {ip_address: i.ip_address, name: i.getnameinfo[0]} }
      raw = addrs.map { |i| "name=#{i[:name]},address=#{i[:ip_address]}" }.join("\n")
      SwissAdmin::Utils::FormatGenerator.build(json: JSON.generate(addrs), raw: raw, table: addrs)
    end

    def self.first_ipv4
      ipv4 = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address
      SwissAdmin::Utils::FormatGenerator.build(json: JSON.generate({ip_address: ipv4}), raw: ipv4, table: [{ip_address: ipv4}])
    end
  end
end
end
