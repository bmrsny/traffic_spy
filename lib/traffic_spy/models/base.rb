module TrafficSpy

  if ENV["TRAFFIC_SPY_ENV"] == "test"
    database_file = 'db/traffic_spy-test.sqlite3'
    DB = Sequel.sqlite database_file
  else
    DB = Sequel.postgres "traffic_spy"
  end

end


# Require all the files within the model directory here...
require 'uri'
require 'traffic_spy/models/model_helper'
require 'traffic_spy/models/source'
require 'traffic_spy/models/url'
require 'traffic_spy/models/payload'
require 'traffic_spy/models/respondedIn'
require 'traffic_spy/models/referredBy'
require 'traffic_spy/models/userAgent'
require 'traffic_spy/models/resolution'
require 'traffic_spy/models/event'
