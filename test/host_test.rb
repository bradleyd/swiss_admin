require_relative "test_helper"
require 'socket'


class HostTest < MiniTest::Test
  def setup
    @host = Socket.gethostname
    @first_ipv4 = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address
  end

  def test_host_returns_host_name
    assert_equal @host, SwissAdmin::Host.name
  end

  def test_host_returns_ip_list
    assert_kind_of Array, SwissAdmin::Host.ip_addresses
  end

  def test_first_ipv4_returns_ip_addres
    assert_equal @first_ipv4, SwissAdmin::Host.first_ipv4
  end

  def test_returns_cpu_count
    assert_kind_of Integer, SwissAdmin::Host.cpus
  end
end
