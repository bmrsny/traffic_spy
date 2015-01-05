require_relative 'feature_test_helper'


class FrontPageTest < FeatureTest
  include Capybara::DSL

  def app
    TrafficSpy::Server
  end

  def test_hits_front_page
    visit '/'  #is this a get?
    assert page.has_content?("Hello, Traffic Spyer")
  end

end
