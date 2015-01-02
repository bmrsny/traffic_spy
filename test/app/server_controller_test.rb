require_relative '../test_helper'

class ServerControllerTest < Minitest::Test
  # include Rack::Test::Methods

  def app
    TrafficSpy::Server
  end

  def teardown
    TrafficSpy::DB.from(:sources).delete
    TrafficSpy::DB.from(:urls).delete
    TrafficSpy::DB.from(:payloads).delete
    TrafficSpy::DB.from(:respondedIn).delete
    TrafficSpy::DB.from(:refferedBy).delete
    TrafficSpy::DB.from(:UserAgent).delete
    TrafficSpy::DB.from(:resolution).delete
    TrafficSpy::DB.from(:event).delete
  end

  def test_server_can_register_a_client_with_200_status
    post '/sources', 'identifier=jumpstartlab&rootUrl=http://jumpstartlab.com'
    assert_equal 200, last_response.status
  end
end
