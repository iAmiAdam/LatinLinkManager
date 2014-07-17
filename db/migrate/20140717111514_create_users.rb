class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :type

      t.timestamps

      Users.new(:name => "Adam Smith", :email => "adam.smith18@ntlworld.com", :password_digest => "testing")
    end
  end
end
