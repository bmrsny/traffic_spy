module TrafficSpy

  class Event
    extend ModelHelper

    def self.table
      DB.from(:events)
    end

    def self.sorted_events_by(identifier)
      combined_db = DB.from(:sources).join(:payloads, :source_id => :id).join(:events, :id => :eventName_id)
      filtered_db = combined_db.filter(:source_id => identifier_id(identifier))
      filtered_db.order(Sequel.desc(:event)).select(:event).to_a.uniq
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

    def self.hourly_breakdown(identifier, eventname)
      combined_db = DB.from(:sources).join(:payloads, :source_id => :id).join(:events, :id => :eventName_id)
      filtered_db = combined_db.filter(:source_id => identifier_id(identifier))

      #filtered_db.inject(Hash.new(0)) {|hash, ele| hash[DateTime.parse("#{ele[:requestedAt]}").strftime('%H')] += 1; hash}
      filtered_db.inject(Hash.new(0)) {|hash, ele| hash["#{ele[:requestedAt]}".split[1].split(':').first] += 1; hash}
    end

  end
end
