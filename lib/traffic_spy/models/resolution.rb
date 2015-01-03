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

    def self.sorted_resolutions_by(identifier)
      

    end

    # def self.user_agent_breakdown(identifier)
    #   filtered_db = DB.from(:sources).join(:payloads, :source_id => :id)
    #   .join(:userAgents, :id => :userAgent_id)
    #   .where(:source_id => identifier_id(identifier))
    #   filtered_db.to_a.map {|hash| hash[:client_software]}
    # end
    #
    # def self.web_browser_breakdown_by(identifier)
    #   browsers = user_agent_breakdown(identifier).map do |software|
    #     software.split[0]
    #   end
    #   browsers.inject(Hash.new(0)) {|hash, browser| hash[browser] += 1; hash}
    #   .sort_by {|key, value| value}.reverse
    # end
    #
    # def self.web_os_breakdown_by(identifier)
    #   oss = user_agent_breakdown(identifier).map do |software|
    #     software.split[1][1..-2]
    #   end
    #   oss.inject(Hash.new(0)) {|hash, os| hash[os] += 1; hash}
    #   .sort_by {|key, value| value}.reverse
    # end


  end
end
