require_relative "test_helper"

class HostTest < Minitest::Test
  def test_host_returns_host_name
    assert_equal SwissAdmin::TestHelpers.hostname,
      SwissAdmin::Host.name[:raw]
  end

  def test_host_return_current_load
    assert SwissAdmin::Host.loadavg
  end
end
