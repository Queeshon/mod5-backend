class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :url
      t.belongs_to :user, foreign_key: true
      t.belongs_to :battle, foreign_key: true

      t.timestamps
    end
  end
end
