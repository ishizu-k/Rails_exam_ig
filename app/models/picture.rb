class Picture < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { maximum: 2200 }
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites, dependent: :destroy
end
