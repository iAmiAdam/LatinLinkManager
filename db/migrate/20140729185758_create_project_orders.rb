class CreateProjectOrders < ActiveRecord::Migration
  def change
    create_table :project_orders do |t|
      t.string :project_id
      t.string :order_id

      t.timestamps
    end
  end
end
