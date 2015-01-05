require_relative 'controller_test_helper'

class ServerControllerTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TrafficSpy::Server
  end

  def test_server_can_register_a_client_with_200_status
    post '/sources', 'identifier=jumpstartl&rootUrl=http://jumpstartlab.com'
    assert_equal 200, last_response.status
  end

  def test_server_will_throw_403_if_already_registered
    TrafficSpy::Source.create({:identifier => "jumpstartlab", :root_url => "http://xxjumpstartlab.com"})
    post '/sources', 'identifier=jumpstartlab&rootUrl=http://jumpstartlab.com'
    assert_equal 200, last_response.status
    TrafficSpy::Source.create({:identifier => "jumpstartlab", :root_url => "http://xxjumpstartlab.com"})
    post '/sources', 'identifier=jumpstartlab&rootUrl=http://jumpstartlab.com'
    assert_equal 403, last_response.status
  end

  def test_application_details_page_loads_when_sources_and_identifier_in_url
    get '/sources/jumpstartlab'
    assert last_response.ok?
    assert_equal 200, last_response.status
  end
end
