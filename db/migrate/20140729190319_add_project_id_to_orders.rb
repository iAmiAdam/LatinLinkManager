class AddProjectIdToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :project_id, :string
  end
end
