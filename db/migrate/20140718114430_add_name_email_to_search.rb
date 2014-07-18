class AddNameEmailToSearch < ActiveRecord::Migration
  def change
  	add_column :searches, :name, :string
  	add_column :searches, :rate, :string
  end
end
