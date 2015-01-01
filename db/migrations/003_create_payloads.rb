Sequel.migration do
  change do
    create_table(:payloads) do
      primary_key   :id
      String        :url
      String        :requestedAt
      String        :respondedIn
      String        :referredBy
      String        :requestType
      String        :parameters
      String        :eventName
      String        :userAgent
      Integer       :resolutionWidth
      Integer       :resolutionHeight
      Integer       :ip
    end
  end
end
