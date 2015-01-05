require_relative 'controller_test_helper'

class ServerControllerTest < Minitest::Test
   include Rack::Test::Methods

  def app
    TrafficSpy::Server
  end

  def test_server_can_register_a_client_with_200_status
    post '/sources', 'identifier=jumpstartlab&rootUrl=http://jumpstartlab.com'
    assert_equal 200, last_response.status
  end
end
