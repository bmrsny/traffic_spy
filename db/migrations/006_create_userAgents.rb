Sequel.migration do
  change do
    create_table(:userAgents) do
      primary_key   :id
      String        :client_software
    end
  end
end
