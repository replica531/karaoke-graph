class Result < ApplicationRecord
  belongs_to :music
  validates :music_id, presence: true
  validates :point, presence: true
  validates :datetime, presence: true
end
