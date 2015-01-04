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

    def self.url_path_shortest_response(identifier, path)
      combined_db = DB.from(:sources).join(:payloads, :source_id => :id).join(:urls, :id => :url_id)
      filtered_db = combined_db.filter(:source_id => identifier_id(identifier))
      filtered_by_url = filtered_db.select(:url, :respondedIn).to_a

      # filtered_by_url.map {|hash| hash[:url]}.inject(Hash.new(0)) {|hash, url| hash[url] += 1; hash}
      #   urls_and_times = filtered_by_url.inject(Hash.new(0)) {|hash, ele| hash[ele[:url]] = ele[:respondedIn]; hash}
      #                                 .sort_by {|k,v| v }.reverse
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
