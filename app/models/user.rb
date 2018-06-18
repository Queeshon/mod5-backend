class User < ApplicationRecord
  has_secure_password

  has_many :battlelogs
  has_many :battles, through: :battlelogs, dependent: :destroy

  has_many :likes
  has_many :current_battles, through: :likes, dependent: :destroy, class_name: "Battle"

end
