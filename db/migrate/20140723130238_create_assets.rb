class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.attachment :file
      t.string :project_id

      t.timestamps
    end
  end
end
