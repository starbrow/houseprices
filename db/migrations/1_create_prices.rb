Sequel.migration do
  up do
    create_table(:prices) do
      primary_key :id
      Integer :estimated_value, :null=>false
      Integer :value_range_lower, :null=>false
      Integer :value_range_upper, :null=>false
      Date :date, :null=>false, :unique=>true
    end
  end

   down do
     drop_table(:prices)
   end

end
