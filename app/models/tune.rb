# frozen_string_literal: true

class Tune < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :artist, presence: true
  validates :user_id, presence: true
  validate :validate_tune_existance, on: :create
  has_many :results, dependent: :destroy

  def average_score
    return 0 if results.empty?

    score_sum = 0
    results.each do |result|
      score_sum += result.score
    end
    (score_sum / results.length).round(3)
  end

  private

  def validate_tune_existance
    errors.add(:base, '曲がすでに登録済みです') if Tune.where(user_id: user.id, title: title, artist: artist).present?
  end
end
