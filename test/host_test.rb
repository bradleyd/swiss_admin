require_relative "test_helper"

class HostTest < MiniTest::Test
  def setup
    @host = Socket.gethostname
  end

  def test_host_returns_host_name
    assert_equal @host, SwissAdmin::Host.name
  end

  def test_host_return_current_load
    assert SwissAdmin::Host.loadavg
  end
end
