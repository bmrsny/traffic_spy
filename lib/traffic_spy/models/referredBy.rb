module TrafficSpy

  class ReferredBy

    def self.table
      DB.from(:referredBys)
    end
    #
    # def self.create(attributes, url_id)
    #   table.insert(
    #   :url_address => attributes["referredBy"],
    #   :url_id => url_id
    #   )
    # end

    def self.exist?(url_address)
      table.where(
      :url_address => url_address
      ).count > 0
    end

    def self.return_id(url_address)
      if exist?(url_address)
        table.select(:id).where(:url_address => url_address)
      else
        table.insert(
        :url_address => url_address
        )
        table.select(:id)
      end
    end

  end
end
