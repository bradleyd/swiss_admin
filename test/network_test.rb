require_relative "test_helper"

class NetworkTest < Minitest::Test

  def test_host_returns_ip_list
    assert_kind_of String, SwissAdmin::Network::IP.addresses[:raw]
  end

  def test_first_ipv4_returns_ip_addres
    assert_equal SwissAdmin::TestHelpers.first_ipv4, 
      SwissAdmin::Network::IP.first_ipv4
  end
end
