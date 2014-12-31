module TrafficSpy

  class Url

    def self.table
      DB.from(:urls)
    end

    def self.create(payload, identifier_id)
      table.insert(
      :url => payload["url"],
      :source_id => identifier_id,
      )
    end

    def self.exist?(identifier)
      table.where(
        :identifier => identifier
      ).count > 0
    end
  end
end
