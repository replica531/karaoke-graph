# frozen_string_literal: true

class Tune < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :artist, presence: true
  validates :user_id, presence: true
  validates :title, uniqueness: { scope: :artist }
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
