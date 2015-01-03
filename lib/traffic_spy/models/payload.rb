module TrafficSpy

  class Payload

    def self.table
      DB.from(:payloads)
    end

    def self.create(attributes, identifier)
      table.insert(
      :source_id => Source.return_id(identifier),
      :url_id => Url.return_id(attributes["url"]),
      :requestedAt => attributes["requestedAt"],
      :respondedIn => attributes["respondedIn"],
      :referredBy_id => ReferredBy.return_id(attributes["referredBy"]),
      :requestType => attributes["requestType"],
      :parameters => attributes["parameters"].join(','),
      :eventName_id => Event.return_id(attributes["eventName"]),
      :userAgent_id => UserAgent.return_id(attributes["userAgent"]),
      :resolution_id => Resolution.return_id(attributes),
      :ip => attributes["ip"]
      )

    # rescue Sequel::ForeignKeyContraintViolation
    #   false
    # rescue Sequel::UniqueContraintviolation
    #   false

    end

    def self.exist?(attributes, identifier)
      table.where(
      :source_id => Source.return_id(identifier),
      :url_id => Url.return_id(attributes["url"]),
      :requestedAt => attributes["requestedAt"],
      :respondedIn => attributes["respondedIn"],
      :referredBy_id => ReferredBy.return_id(attributes["referredBy"]),
      :requestType => attributes["requestType"],
      :parameters => attributes["parameters"].join(','),
      :eventName_id => Event.return_id(attributes["eventName"]),
      :userAgent_id => UserAgent.return_id(attributes["userAgent"]),
      :resolution_id => Resolution.return_id(attributes),
      :ip => attributes["ip"]
      ).count > 0

      #why no working?
      # table.where(
      # :identifier => identifier
      # ).to_a.first[:identifier] == identifier
    end

    # def self.find_id_by(identifier)
    #   table.where(
    #   :identifier => identifier
    #   ).to_a.first[:id]
    # end

    def self.sorted_urls_by(identifier)
      source_id = Source.find_id_by(identifier)
      #this code below is strange but this works... orion explained this to me.
      combined_db = DB.from(:sources).join(:payloads, :source_id => :id).join(:urls, :id => :url_id)
      combined_db.where(:source_id => source_id)
      
      #this works okay... this will give you an array of hashes where the narrowed down the payload down to a single identifier. Now what?
    end


    # DB[:items].join(:categories, :id => :category_id).join(:groups, :id => :items__group_id)
    # below is SQL equivalent
    # # SELECT * FROM items
    # # INNER JOIN categories ON categories.id = items.category_id
    # # INNER JOIN groups ON groups.id = items.group_id
    #
    #
    # print out the number of records
    # puts "Item count: #{items.count}"
    #
    # print out the average price
    # puts "The average price is: #{items.avg(:price)}"
  end
end
