class MusclePost < ApplicationRecord
  belongs_to :custmer
  has_many :favorites,dependent: :destroy
  
  validates :sentence,length: {maximum: 100}
end
