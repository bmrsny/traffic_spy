module TrafficSpy

  class Event

    def self.table
      DB.from(:events)
    end

    # def self.create(attributes, source_id)
    #   table.insert(
    #   :event => attributes["eventName"],
    #   :source_id => source_id
    #   )
    # end

    def self.exist?(event)
      table.where(
      :event => event
      ).count > 0
    end

    def self.return_id(event)
      if exist?(event)
        table.select(:id).where(:event => event)
      else
        table.insert(
        :event => event
        )
        table.select(:id).to_a.last[:id]

      end
    end


  end
end
