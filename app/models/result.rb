class Result < ApplicationRecord
  belongs_to :music
  validates :music_id, presence:true
end
