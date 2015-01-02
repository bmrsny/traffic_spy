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

    def self.find_id_by(url)
      table.where(
      :url => url
      ).to_a.first[:id]
    end

  end
end
