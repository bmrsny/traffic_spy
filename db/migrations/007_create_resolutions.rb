Sequel.migration do
  change do
    create_table(:resolutions) do
      primary_key   :id
      String        :resolution
      # String        :resW
    end
  end
end
