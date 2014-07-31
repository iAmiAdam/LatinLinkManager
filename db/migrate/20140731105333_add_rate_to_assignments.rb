class AddRateToAssignments < ActiveRecord::Migration
  def change
  	add_column :assignments, :rate, :float
  end
end
