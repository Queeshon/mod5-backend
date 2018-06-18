class Battle < ApplicationRecord
  has_many :battlelogs
  has_many :users, through: :battlelogs

  has_many :likes
  has_many :current_users, through: :likes, class_name: "User"
end
