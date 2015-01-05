require_relative "../test_helper"
require_relative "../../lib/traffic_spy"

class ControllerTest < Minitest::Test
  def teardown
    TrafficSpy::DB.from(:sources).delete
    TrafficSpy::DB.from(:urls).delete
    TrafficSpy::DB.from(:payloads).delete
    TrafficSpy::DB.from(:respondedIns).delete
    TrafficSpy::DB.from(:referredBys).delete
    TrafficSpy::DB.from(:UserAgents).delete
    TrafficSpy::DB.from(:resolutions).delete
    TrafficSpy::DB.from(:events).delete
    TrafficSpy::DB.from(:sqlite_sequence).delete
  end
end
