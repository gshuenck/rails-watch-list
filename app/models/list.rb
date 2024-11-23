class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :image

  validates :name, presence: true, uniqueness: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
