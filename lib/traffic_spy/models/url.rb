module TrafficSpy

  class Url
    extend ModelHelper

    def self.table
      DB.from(:urls)
    end

    # def self.create(payload, identifier_id)
    #   table.insert(
    #   :url => payload["url"],
    #   :source_id => identifier_id,
    #   )
    # end

    def self.exist?(url)
      table.where(
        :url => url
      ).count > 0
    end

    def self.return_id(url)   #grabbing existing id, or creating + returning a new id
      if exist?(url)
        table.select(:id).where(:url => url)   #this returns the id in the url table where :url == url
      else
        table.insert(
        :url => url
        )
        table.select(:id).to_a.last[:id]
      end
    end

    def self.sorted_urls_by(identifier)
      combined_db = DB.from(:sources).join(:payloads, :source_id => :id).join(:urls, :id => :url_id)
      filtered_db = combined_db.filter(:source_id => identifier_id(identifier))
      sorted_hashes = filtered_db.to_a.map {|hash| hash[:url]}.inject(Hash.new(0)) {|hash, url| hash[url] += 1; hash}
      desc_sorted_array = sorted_hashes.sort_by {|key, value| value}.reverse
    end

    def self.url_relative_path(identifier, relative)
      sorted_urls_by(identifier).map do |array|
        url = array[0]
        clean_url_path = URI(url).path.gsub(/^\//, "")
      end.uniq.select { |sorted_path| sorted_path == relative }
         .join
    end

    def self.url_response_times(identifier, full_url)
      combined_db = DB.from(:sources).join(:payloads, :source_id => :id).join(:urls, :id => :url_id)
      filtered_db = combined_db.filter(:source_id => identifier_id(identifier))
      urls_and_times = filtered_db.select(:url, :respondedIn)
      clean_url = url_cleaner(identifier, full_url)
      filter_by_url = urls_and_times.where(:url => clean_url)
    end

    def self.url_path_shortest_and_longest_response_times(identifier, full_url)
      url_response_times(identifier, full_url).minmax_by {|key, value| key[:respondedIn]}
    end

    def self.url_avg_response_times(identifier, full_url)
      url_response_times(identifier, full_url).avg(:respondedIn).to_i
    end

    def self.url_cleaner(identifier, full_url)
      x = full_url.split('/').delete_if {|ele| ele == 'sources' || ele == 'urls' || ele == "" || ele == "#{identifier}"}.join('/')
      x.gsub('localhost:9393', "/#{identifier}.com")
    end

    def self.url_verbs(identifier, full_url)
      combined_db = DB.from(:sources).join(:payloads, :source_id => :id).join(:urls, :id => :url_id)
      filtered_db = combined_db.filter(:source_id => identifier_id(identifier))
      urls_and_request_types = filtered_db.select(:url, :requestType)
      clean_url = url_cleaner(identifier, full_url)
      filter_by_url = urls_and_request_types.where(:url => clean_url)
      filter_by_url.to_hash(:requestType).keys.join(' ')
    end

    def self.relative_check?(identifier, full_url)
      combined_db = DB.from(:sources).join(:payloads, :source_id => :id).join(:urls, :id => :url_id)
      filtered_db = combined_db.filter(:source_id => identifier_id(identifier))
      clean_url = url_cleaner(identifier, full_url)
      exists?(clean_url, filtered_db)
    end

    def self.exists?(clean_url, filtered_db)
      filtered_db.where(:url => clean_url).to_a.count > 0
    end
    # def self.find_id_by(url)
    #   table.where(
    #   :url => url
    #   ).to_a.first[:id]
    # end
    #
    # def self.selected_urls(source_id)
    #   table.where(
    #   :source_id => source_id
    #   ).to_a
    # end

    # def self.sorted_urls(source_id)
    #   list = selected_urls(source_id).map {|url| url[:url]}.inject(Hash.new(0)) {|total, element| total[element] += 1 ; total}
    #   list.sort_by {|key, value| value}.reverse
    # end

    # def <=>()
    #   other.
    # end

  end
end
