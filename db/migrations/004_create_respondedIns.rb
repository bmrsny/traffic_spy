Sequel.migration do
  change do
    create_table(:respondedIns) do
      primary_key   :id
      Integer       :time
    end
  end
end
