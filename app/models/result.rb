# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :music
  belongs_to :user
  validates :music_id, presence: true
  validates :user_id, presence: true
  validates :score, presence: true
  validates :datetime, presence: true

  enum models: {
    DAM: 'DAM',
    JOYSOUND: 'JOYSOUND',
    その他: 'その他'
  }
end
