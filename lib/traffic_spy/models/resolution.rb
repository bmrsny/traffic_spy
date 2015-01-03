module TrafficSpy

  class Resolution

    def self.table
      DB.from(:resolutions)
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

    def self.exist?(attributes)
      table.where(
      :resolution => resolution(attributes)
      ).count > 0
    end

    def self.return_id(attributes)
      if exist?(attributes)
        table.select(:id).where(:resolution => resolution(attributes))
      else
        table.insert(
        :resolution => resolution(attributes)
        )
        table.select(:id).to_a.last[:id]
      end
    end


  end
end
