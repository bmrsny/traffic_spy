module TrafficSpy

  class Source

    def self.table
      DB.from(:sources)
    end

    def self.create(attributes)
      table.insert(
      :identifier => attributes["identifier"],
      :root_url => attributes["rootUrl"],
      )
    end

    def self.exist?(identifier)
      table.where(
        :identifier => identifier
      ).count > 0

      #why no working?
      # table.where(
      # :identifier => identifier
      # ).to_a.first[:identifier] == identifier
    end
    #
    def self.find_id_by(identifier)
      table.where(
      :identifier => identifier
      ).to_a.first[:id]
    end

    def self.return_id(identifier)
      table.where(
      :identifier => identifier
      ).to_a.first[:id]
    end
  end
end
