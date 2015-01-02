module TrafficSpy

  class UserAgent

    def self.table
      DB.from(:userAgent)
    end

    def self.create(attributes, source_id)
      table.insert(
      :OS => attributes["userAgent"].split[1][1..-2],
      :Browser => attributes["userAgent"].split[0],
      :source_id => source_id
      )
    end

  end
end
