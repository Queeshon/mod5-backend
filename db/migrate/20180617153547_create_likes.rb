class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :count
      t.belongs_to :battle, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
