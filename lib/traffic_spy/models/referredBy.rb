module TrafficSpy

  class RespondedIn

    def self.table
      DB.from(:referredBy)
    end

    def self.create(attributes, url_id)
      table.insert(
      :time => attributes["respondedIn"],
      :url_id => url_id
      )
    end

    def self.exist?(attributes)
      table.where(
      attributes["respondedIn"]).count > 0
    end

  end
end
