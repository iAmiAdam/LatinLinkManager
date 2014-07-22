class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :LLID
      t.string :value
      t.integer :category
      t.boolean :paid, :default => false

      t.timestamps
    end
  end
end
