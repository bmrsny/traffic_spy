module TrafficSpy

  class Event

    def self.table
      DB.from(:events)
    end

    def self.create(attributes, source_id)
      table.insert(
      :event => attributes["eventName"],
      :source_id => source_id
      )
    end
  end
end
