class MusclePost < ApplicationRecord
  belongs_to :customer
  has_many :favorites,dependent: :destroy
   has_one_attached :post_image

  validates :sentence,length: {maximum: 100}
  validates :weight,numericality: { only_integer: true }
  validates :body_weight,numericality: { only_integer: true }
  validates :times,numericality: { only_integer: true }

  def get_profile_image
    profile_image.attached? ? post_image : 'no_image.jpg'
  end
end
