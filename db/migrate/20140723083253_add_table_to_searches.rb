class AddTableToSearches < ActiveRecord::Migration
  def change
  	add_column :searches, :table, :string
  end
end
