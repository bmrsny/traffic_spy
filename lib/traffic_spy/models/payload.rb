module TrafficSpy

  class Payload

    def self.table
      DB.from(:payloads)
    end

    def self.create(attributes)
      #might need to turn symbols into strings
      # binding.pry
      table.insert(
      :url => attributes["url"],
      :requestedAt => attributes["requestedAt"],
      :respondedIn => attributes["respondedIn"],
      :referredBy => attributes["referredBy"],
      :requestType => attributes["requestType"],
      :parameters => attributes["parameters"],
      :eventName => attributes["eventName"],
      :userAgent => attributes["userAgent"],
      :resolutionWidth => attributes["resolutionWidth"],
      :resolutionHeight => attributes["resolutionHeight"],
      :ip => attributes["ip"]
      )

    # rescue Sequel::ForeignKeyContraintViolation
    #   false
    # rescue Sequel::UniqueContraintviolation
    #   false

    end

    def self.exist?(attributes)
      table.where(
         attributes["url"] &&
         attributes["requestedAt"] &&
         attributes["respondedIn"] &&
         attributes["referredBy"] &&
         attributes["requestType"] &&
         attributes["parameters"] &&
         attributes["eventName"] &&
         attributes["userAgent"] &&
         attributes["resolutionWidth"] &&
         attributes["resolutionHeight"] &&
         attributes["ip"]
      ).count > 0

      #why no working?
      # table.where(
      # :identifier => identifier
      # ).to_a.first[:identifier] == identifier
    end

    def self.find_id_by(identifier)
      table.where(
      :identifier => identifier
      ).to_a.first[:id]
    end
  end
end
