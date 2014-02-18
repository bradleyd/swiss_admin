require_relative "test_helper"


class HardwareTest < MiniTest::Test

  def test_returns_cpu_count
    assert_kind_of Integer, SwissAdmin::Hardware.cpus
  end
end
