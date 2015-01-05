require_relative "../test_helper"
require_relative "../../lib/traffic_spy"

class ControllerTest < Minitest::Test
  def teardown
    TrafficSpy::DB.from(:sources).delete
    TrafficSpy::DB.from(:urls).delete
    TrafficSpy::DB.from(:payloads).delete
    TrafficSpy::DB.from(:respondedIn).delete
    TrafficSpy::DB.from(:refferedBy).delete
    TrafficSpy::DB.from(:UserAgent).delete
    TrafficSpy::DB.from(:resolution).delete
    TrafficSpy::DB.from(:event).delete
    TrafficSpy::DB.from(:sqlite_sequence).delete
  end
end
