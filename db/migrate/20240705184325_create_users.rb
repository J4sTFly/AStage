class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :password_digest

      t.timestamps

      t.index :username, unique: true
      t.index :email, unique: true
    end
  end
end
