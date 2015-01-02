module TrafficSpy

  class ReferredBy

    def self.table
      DB.from(:referredBy)
    end

    def self.create(attributes, url_id)
      table.insert(
      :url_address => attributes["referredBy"],
      :url_id => url_id
      )
    end

  end
end
