require_relative "../test_helper"

class CLIHostTest < MiniTest::Test
  def setup
    @host = Socket.gethostname
  end

  def test_cli_host_name_returns_host_name
    assert_output("#{@host}\n") { 
      SwissAdmin::CLI.start %w{ host name }
    }
  end
  
  def test_cli_host_loadavg_returns_system_load
    assert_output(/[\d\.]+\W+[\d\.]+\W+[\d\.]+\W+[\d\/]+\W+\d+/) { 
      SwissAdmin::CLI.start %w{ host loadavg }
    }
  end

end
