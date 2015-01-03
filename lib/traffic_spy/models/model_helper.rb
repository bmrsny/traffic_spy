module TrafficSpy

  module ModelHelper
    def identifier_id(identifier)
      Source.find_id_by(identifier)
    end
  end
end
