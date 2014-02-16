require_relative "test_helper"
require 'socket'


class CLIHostTest < MiniTest::Test
  def setup
    @host = Socket.gethostname
    @first_ipv4 = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}.ip_address
  end

  def test_cli_host_name_returns_host_name
    assert_output("#{@host}\n") { 
      SwissAdmin::CLI.start %w{ host name }
    }
  end

  def test_cli_cpus_returns_cpus_count
    assert_output("4\n") { 
      SwissAdmin::CLI.start %w{ host cpus }
    }
  end

end
