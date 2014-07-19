class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :lid
      t.string :cost
      t.string :source
      t.string :target
      t.string :count

      t.timestamps
    end
  end
end
