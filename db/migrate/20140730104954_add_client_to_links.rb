class AddClientToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :client_id, :string
  end
end
