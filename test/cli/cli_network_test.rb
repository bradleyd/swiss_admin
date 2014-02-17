require_relative "test_helper"
require 'socket'


class CLINetworkTest < MiniTest::Test
  def setup
    @host = Socket.gethostname
    @first_ipv4 = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address
  end

  def test_first_ipv4_returns_first_interface
    assert_output("#{@first_ipv4}\n") { 
      SwissAdmin::CLI.start %w{ network first_ipv4 }
    }
  end
 
end
