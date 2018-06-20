class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :username
      t.string :avatar
      t.integer :wins, default: 0
      t.string :cute_pic

      t.timestamps
    end
  end
end
