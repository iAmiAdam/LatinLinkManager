class AddTimeToProjects < ActiveRecord::Migration
  def change
  	add_column :projects, :time, :time
  end
end
