class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :translator_id
      t.string :project_id

      t.timestamps
    end
  end
end
