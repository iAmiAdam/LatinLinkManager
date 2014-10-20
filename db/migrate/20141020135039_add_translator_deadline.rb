class AddTranslatorDeadline < ActiveRecord::Migration
  def change
  	add_column :projects, :translator_deadline, :date
  	add_column :projects, :translator_time, :time
  end
end
