module TrafficSpy

  class RespondedIn

    def self.table
      DB.from(:respondedIn)
    end

    def self.create(attributes, url_id)
      table.insert(
      :time => attributes["respondedIn"],
      :url_id => url_id
      )
    end

  end
end
