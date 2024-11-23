class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  has_many :reviews, dependent: :destroy

  validates :comment, length: { minimum: 6 }
  validates :movie, presence: true
  validates :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id, message: "has already been bookmarked in this list" }
end
