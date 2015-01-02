Sequel.migration do
  change do
    create_table(:payloads) do
      primary_key   :id
      String        :url
      String        :requestedAt
      Integer       :respondedIn
      String        :referredBy
      String        :requestType
      String        :parameters
      String        :eventName
      String        :userAgent
      Integer       :resolutionWidth
      Integer       :resolutionHeight
      String        :ip
      # unique        [
      #               :id
      #               :url
      #               :re
      # ]
    end
  end
end
