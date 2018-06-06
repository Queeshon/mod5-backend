class CreateBattlelogs < ActiveRecord::Migration[5.1]
  def change
    create_table :battlelogs do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :battle, foreign_key: true

      t.timestamps
    end
  end
end
