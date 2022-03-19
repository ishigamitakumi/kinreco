class MusclePost < ApplicationRecord
  belongs_to :customer
  belongs_to :muscle_menu
  has_many :favorites,dependent: :destroy
  has_one_attached :post_image

  validates :sentence,length: {maximum: 100}, presence: true
  validates :weight,numericality: { only_integer: true }, presence: true
  validates :body_weight,numericality: true, presence: true
  validates :times,numericality: { only_integer: true }, presence: true

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def get_post_image
    post_image.attached? ? post_image : 'no_image.jpg'
  end
end
