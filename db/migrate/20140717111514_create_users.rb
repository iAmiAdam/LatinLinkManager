class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.String :name
      t.string :email
      t.string :password_digest
      t.integer :type

      t.timestamps
    end
  end
end
