class Battle < ApplicationRecord
  has_many :battlelogs
  has_many :users, through: :battlelogs
end
