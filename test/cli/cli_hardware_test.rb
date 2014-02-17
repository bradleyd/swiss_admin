require_relative "test_helper"


class CLIHardwareTest < MiniTest::Test
  def setup
  end

  def test_cli_cpus_returns_cpus_count
    assert_output("4\n") { 
      SwissAdmin::CLI.start %w{ hardware cpus }
    }
  end
  
  def test_cli_memory_returns_memtotal
    assert_output(/MemTotal/) { 
      SwissAdmin::CLI.start %w{ hardware memory }
    }
  end


end
