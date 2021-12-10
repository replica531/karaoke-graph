class Music < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :artist, presence: true
  validates :user_id, presence: true
  has_many :results, dependent: :destroy

  def average_score
    return 0 if self.results.count == 0
    sum = 0
    self.results.each do |result|
      sum += result.score
    end
    sum / self.results.count
  end
end
