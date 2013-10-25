class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :confirmation_code
      t.string :password_digest
      t.string :remember_token
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :new_email
      t.boolean :confirmed
      t.boolean :admin

      t.timestamps
    end
  end
end
