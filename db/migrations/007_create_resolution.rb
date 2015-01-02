Sequel.migration do
  change do
    create_table(:resolution) do
      primary_key   :id
      String        :Resolution
      Integer       :source_id
    end
  end
end
