Sequel.migration do
  change do
    create_table(:respondedIn) do
      primary_key   :id
      Integer       :time
      Integer       :url_id
      #should above be foreign key?
    end
  end
end
