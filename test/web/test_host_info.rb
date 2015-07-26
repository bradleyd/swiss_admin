require_relative "../test_helper"

class HostInfoTest < Minitest::Test
  include Rack::Test::Methods

  def app
    SwissAdmin::HostInfo
  end

  def test_it_retruns_hardware_info
    get '/host_info'
    assert last_response.ok?
    assert_match /Memory Total/ , last_response.body
  end

  def test_it_retruns_host_name
    get '/host_info'
    assert last_response.ok?
    assert_match /Host Name/ , last_response.body
  end

  def test_it_retruns_host_load
    get '/host_info'
    assert last_response.ok?
    assert_match /Load Average/ , last_response.body
  end

  def test_it_retruns_hardware_cpus
    get '/host_info'
    assert last_response.ok?
    assert_match /Total CPUS/ , last_response.body
  end

  def test_it_retruns_network_ipaddresses
    get '/host_info'
    assert last_response.ok?
    assert_match /IP Address/ , last_response.body
  end
end
