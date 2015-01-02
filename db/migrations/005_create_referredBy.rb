Sequel.migration do
  change do
    create_table(:referredBy) do
      primary_key   :id
      String        :url_address
      Integer       :url_id
    end
  end
end
