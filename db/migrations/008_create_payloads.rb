Sequel.migration do
  change do
    create_table(:payloads) do
      primary_key   :id
      foreign_key   :url_id, :urls
      DateTime      :requestedAt
      Integer       :respondedIn
      foreign_key   :referredBy_id, :referredBys
      String        :requestType
      String        :parameters
      foreign_key   :eventName_id, :events
      foreign_key   :userAgent_id, :userAgents
      foreign_key   :resolution_id, :resolutions
      # foreign_key   :resolution_height_id, :resolutions
      String        :ip

      # unique        [
      #               :id
      #               :url
      #               :re
      # ]
    end
  end
end
