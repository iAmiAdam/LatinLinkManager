class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :LLID
      t.string :value
      t.integer :type
      t.boolean :paid

      t.timestamps
    end
  end
end
