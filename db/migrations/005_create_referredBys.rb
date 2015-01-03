Sequel.migration do
  change do
    create_table(:referredBys) do
      primary_key   :id
      String        :url_address
    end
  end
end
