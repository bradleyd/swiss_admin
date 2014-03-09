require_relative "../test_helper"

class HostInfoTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    SwissAdmin::HostInfo
  end

  def test_it_retruns_hardware_info
    get '/info'
    assert last_response.ok?
    assert_match /Memory Total:/ , last_response.body
  end

  def test_it_retruns_host_name
    get '/info'
    assert last_response.ok?
    assert_match /Host Name:/ , last_response.body
  end

  def test_it_retruns_host_load
    get '/info'
    assert last_response.ok?
    assert_match /Load Average:/ , last_response.body
  end



end
