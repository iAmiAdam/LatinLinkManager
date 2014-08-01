class CreateBreakdowns < ActiveRecord::Migration
  def change
    create_table :breakdowns do |t|
      t.string :project_id
      t.integer :translated
      t.integer :context
      t.integer :repetition
      t.integer :format
      t.integer :hundred
      t.integer :ninety_five
      t.integer :eighty_five
      t.integer :seventy_five
      t.integer :fifty
      t.integer :nomatch
      t.integer :total

      t.timestamps
    end
  end
end
