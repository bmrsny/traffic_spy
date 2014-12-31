Sequel.migration do
  change do
    create_table(:urls) do
      primary_key   :id
      String        :url
      Integer       :source_id
    end
  end
end
