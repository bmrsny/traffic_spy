Sequel.migration do
  change do
    create_table(:userAgent) do
      primary_key   :id
      String        :OS
      String        :Browser
      Integer       :source_id
    end
  end
end
