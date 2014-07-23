class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :tid
      t.string :pid

      t.timestamps
    end
  end
end
