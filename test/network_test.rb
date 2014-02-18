require_relative "test_helper"


class NetworkTest < MiniTest::Test

  def test_host_returns_ip_list
    assert_kind_of Array, SwissAdmin::Network.ip_addresses
  end

  def test_first_ipv4_returns_ip_addres
    assert_equal SwissAdmin::TestHelpers.first_ipv4, 
      SwissAdmin::Network.first_ipv4
  end
end
