module TrafficSpy

  class Source

    def self.table
      DB.from(:sources)   #SELECT * FROM articles
    end

    def self.create(attributes)
      table.insert(
      :identifier => attributes["identifier"],
      :root_url => attributes["rootUrl"],
      )

    end



  end
end
