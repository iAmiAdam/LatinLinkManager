class AddTypeToBreakdown < ActiveRecord::Migration
  def change
  	add_column :breakdowns, :sort, :integer, default: 0
  end
end
