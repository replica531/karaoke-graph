# frozen_string_literal: true

class Music < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :artist, presence: true
  validates :user_id, presence: true
  has_many :results, dependent: :destroy

  def average_score
    return 0 if results.length.zero?

    score_sum = 0
    results.each do |result|
      score_sum += result.score
    end
    (score_sum / results.length).round(3)
  end
end
