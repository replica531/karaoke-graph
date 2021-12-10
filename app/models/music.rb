class Music < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :artist, presence: true
  validates :user_id, presence: true
  has_many :results, dependent: :destroy

  def average_score
    sum = 0
    self.results.each do |result|
      sum += result.score
    end
    sum / self.results.count
  end
end
