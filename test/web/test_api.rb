require_relative "../test_helper"

class HostInfoAPITest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    SwissAdmin::HostInfo
  end

  def test_it_retruns_hardware_info
    get '/api/hardware/memory'
    assert last_response.ok?
    assert_match /MemTotal/ , last_response.body
  end

  def test_it_retruns_hardware_cpus
    get '/api/hardware/cpus'
    assert last_response.ok?
    assert_match /cpus/ , last_response.body
  end


  def test_it_retruns_host_name
    get '/api/host/name'
    assert last_response.ok?
    assert_match /name/ , last_response.body
  end

  def test_it_retruns_host_load
    get '/api/host/loadavg'
    assert last_response.ok?
    assert_match /loadavg/ , last_response.body
  end

  def test_it_retruns_not_implemented
    get '/api/host/idonotexist'
    assert last_response.ok?
    assert_match /Plugin not implemented/ , last_response.body
  end

  ## Users
  def test_it_retruns_current_user
    get '/api/users/current'
    assert last_response.ok?
    assert_match /current/ , last_response.body
  end
  def test_it_retruns_home_for_current_users
    get '/api/users/home'
    assert last_response.ok?
    assert_match /home/ , last_response.body
  end
  def test_it_retruns_active_users
    get '/api/users/active'
    assert last_response.ok?
    assert_match /active/ , last_response.body
  end

  ## network
  def test_it_retruns_all_ip_addresses
    get '/api/network/ip_addresses'
    assert last_response.ok?
    assert_match /ip_addresses/ , last_response.body
  end
  def test_it_retruns_first_ipv4
    get '/api/network/first_ipv4'
    assert last_response.ok?
    assert_match /first_ipv4/ , last_response.body
  end

end
