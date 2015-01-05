require_relative 'controller_test_helper'

class ServerControllerTest < ControllerTest
  include Rack::Test::Methods

  def app
    TrafficSpy::Server
  end

  def test_server_can_register_a_client_with_200_status
    post '/sources', 'identifier=jumpstartzzzz&rootUrl=http://jumpstartlab.com'
    assert_equal 200, last_response.status
  end

  def test_server_cannot_register_a_client_that_already_exists
    post '/sources', 'identifier=jumpstartzzzz&rootUrl=http://jumpstartlab.com'
    post '/sources', 'identifier=jumpstartzzzz&rootUrl=http://jumpstartlab.com'
    assert_equal 403, last_response.status
  end

  def test_server_will_respond_with_missing_parameters
    post '/sources', 'identifier=jumpstartzzzz'
    assert_equal 400, last_response.status
  end

  def test_server_will_throw_403_if_already_registered
    TrafficSpy::Source.create({:identifier => "jumpstartlab", :root_url => "http://xxjumpstartlab.com"})
    post '/sources', 'identifier=jumpstartlab&rootUrl=http://jumpstartlab.com'
    assert_equal 200, last_response.status
    TrafficSpy::Source.create({:identifier => "jumpstartlab", :root_url => "http://xxjumpstartlab.com"})
    post '/sources', 'identifier=jumpstartlab&rootUrl=http://jumpstartlab.com'
    assert_equal 403, last_response.status
  end


  def test_identifier_doesnt_exist_in_database_when_this_page_is_visited_first_time
    get '/sources/jumpstartlab'
    assert last_response.ok?
    assert_equal 403, last_response.status
  end
end
