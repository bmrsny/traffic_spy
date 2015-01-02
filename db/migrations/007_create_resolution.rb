Sequel.migration do
  change do
    create_table(:resolution) do
      primary_key   :id
      String        :resolution
      Integer       :source_id
    end
  end
end
