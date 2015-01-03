module TrafficSpy

  class Payload

    def self.table
      DB.from(:payloads)
    end

    def self.create(attributes)
      table.insert(
      :url_id => Url.return_id(attributes["url"]),
      :requestedAt => attributes["requestedAt"],
      :respondedIn => attributes["respondedIn"],
      :referredBy_id => ReferredBy.return_id(attributes["referredBy"]),
      :requestType => attributes["requestType"],
      :parameters => attributes["parameters"].join(','),
      :eventName_id => Event.return_id(attributes["eventName"]),
      :userAgent_id => UserAgent.return_id(attributes["userAgent"]),
      :resolution_id => Resolution.return_id(attributes)
      # :resolution_height_id => Resolution.return_id(attributes["resolutionHeight"])
      # :ip => attributes["ip"]
      )

    # rescue Sequel::ForeignKeyContraintViolation
    #   false
    # rescue Sequel::UniqueContraintviolation
    #   false

    end

    def self.exist?(attributes)
      table.where(
      :url_id => Url.return_id(attributes["url"]),
      :requestedAt => attributes["requestedAt"],
      :respondedIn => attributes["respondedIn"],
      :referredBy_id => ReferredBy.return_id(attributes["referredBy"]),
      :requestType => attributes["requestType"],
      :parameters => attributes["parameters"].join(','),
      :eventName_id => Event.return_id(attributes["eventName"]),
      :userAgent_id => UserAgent.return_id(attributes["userAgent"]),
      :resolution_id => Resolution.return_id(attributes)
      # :resolution_height_id => Resolution.return_id(attributes["resolutionHeight"]),
      # :ip => attributes["ip"]
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
