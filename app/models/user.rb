class User < ApplicationRecord
  has_many :images
  has_many :battles, through: :images
end
