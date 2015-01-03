module TrafficSpy

  class UserAgent

    def self.table
      DB.from(:userAgents)
    end

    # def self.create(attributes, source_id)
    #   table.insert(
    #   :OS => attributes["userAgent"].split[1][1..-2],
    #   :Browser => attributes["userAgent"].split[0],
    #   :source_id => source_id
    #   )
    # end

    def self.exist?(client_software)
      table.where(
      :client_software => client_software
      ).count > 0
    end

    def self.return_id(client_software)
      if exist?(client_software)
        table.select(:id).where(:client_software => client_software)
      else
        table.insert(
        :client_software => client_software
        )
        table.select(:id).to_a.last[:id]

      end
    end
  end
end
