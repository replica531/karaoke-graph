class User < ApplicationRecord
  has_many :musics
  validates :name, presence: true
  validates :email, presence: true
end
