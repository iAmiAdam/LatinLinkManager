class FixDeadlineColumn < ActiveRecord::Migration
  def change
  	rename_column :projects, :ranslator_deadline, :translator_deadline
  end
end
