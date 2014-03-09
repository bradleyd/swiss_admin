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

  def test_it_retruns_host_name
    get '/api/host/name'
    assert last_response.ok?
    assert_match /host_name/ , last_response.body
  end

  def test_it_retruns_host_load
    get '/api/host/loadavg'
    assert last_response.ok?
    assert_match /load_average/ , last_response.body
  end



end
