class Music < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :artist, presence: true
  validates :user_id, presence: true
  has_many :results
end
