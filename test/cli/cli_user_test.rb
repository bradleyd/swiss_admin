require_relative "../test_helper"

class CLIUserTest < Minitest::Test
  def setup
    @current = `whoami`
    @home    = ENV["HOME"]
  end

  def test_cli_cpus_returns_cpus_count
    assert_output("#{@current}") { 
      SwissAdmin::CLI.start %w{ user current }
    }
  end

  def test_cli_home_returns_home_directory_of_current_user
    assert_output("#{@home}\n") {
      SwissAdmin::CLI.start %w{ user home }
    }
  end
 
  def test_cli_active_returns_active_users
    return true if OS::Underlying.docker?
    assert_output(/#{@current.chomp}/) {
      SwissAdmin::CLI.start %w{ user active }
    }
  end
  
end
