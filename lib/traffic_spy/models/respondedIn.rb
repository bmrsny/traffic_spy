module TrafficSpy

  class RespondedIn
    extend ModelHelper

    def self.table
      DB.from(:respondedIns)
    end

    def self.create(attributes, url_id)
      table.insert(
      :time => attributes["respondedIn"],
      :url_id => url_id
      )
    end

    def self.urls_and_times_by(identifier)
      combined_db = DB.from(:sources).join(:payloads, :source_id => :id).join(:urls, :id => :url_id)
      filtered_db = combined_db.filter(:source_id => identifier_id(identifier))
      filtered_by_url = filtered_db.select(:url, :respondedIn)
      urls_and_divisors = filtered_by_url.to_a.map {|hash| hash[:url]}.inject(Hash.new(0)) {|hash, url| hash[url] += 1; hash}
      urls_and_times = filtered_by_url.inject(Hash.new(0)) {|hash, ele| hash[ele[:url]] += ele[:respondedIn]; hash}
      zipped_urls_and_times = urls_and_times.zip(urls_and_divisors)
      zipped_urls_and_times.map do |array|
        array.inject(Hash.new(0)) {|hash, ele| hash[array[0][0]] = array[0][1]/array[1][1]; hash}
      end.sort_by {|hash| hash.values}.reverse
    end

  end
end
