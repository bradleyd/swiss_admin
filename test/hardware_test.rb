require_relative "test_helper"


class HardwareTest < Minitest::Test

  def test_returns_cpu_count
    assert_kind_of Integer, SwissAdmin::Hardware.cpus[:raw]
  end
end
