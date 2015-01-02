Sequel.migration do
  change do
    create_table(:event) do
      primary_key   :id
      String        :event
      Integer       :source_id
    end
  end
end
