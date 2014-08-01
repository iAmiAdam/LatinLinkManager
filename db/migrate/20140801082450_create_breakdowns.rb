class CreateBreakdowns < ActiveRecord::Migration
  def change
    create_table :breakdowns do |t|
      t.string :project_id
      t.integer :translated
      t.integer :context
      t.integer :repetition
      t.integer :format
      t.integer :100
      t.integer :95
      t.integer :85
      t.integer :75
      t.integer :50
      t.integer :new
      t.integer :total

      t.timestamps
    end
  end
end
