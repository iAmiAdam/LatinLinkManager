class AddTypeToBreakdown < ActiveRecord::Migration
  def change
  	add_column :breakdowns, :type, :integer, default: 0
  end
end
