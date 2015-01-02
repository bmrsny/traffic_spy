module TrafficSpy

  class Resolution

    def self.table
      DB.from(:resolution)
    end

    def self.create(attributes, source_id)
      table.insert(
      :resolution => resolution(attributes),
      :source_id => source_id
      )
    end

    def self.resolution(attributes)
      attributes["resolutionWidth"] + " x " + attributes["resolutionHeight"]
    end

  end
end
