class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :order_id
      t.string :project_id
      t.string :translator_id

      t.timestamps
    end
  end
end
