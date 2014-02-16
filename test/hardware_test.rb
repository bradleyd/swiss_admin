require_relative "test_helper"
require 'socket'


class HardwareTest < MiniTest::Test
  def setup
    @host = Socket.gethostname
    @first_ipv4 = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address
  end

  def test_returns_cpu_count
    assert_kind_of Integer, SwissAdmin::Host.cpus
  end
end
