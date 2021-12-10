class Music < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :artist, presence: true
  validates :user_id, presence: true
  has_many :results, dependent: :destroy

  def average_score
    return 0 if self.results.count == 0
    score_sum = 0
    self.results.each do |result|
      score_sum += result.score
    end
    (score_sum / self.results.count).round(3)
  end
end
