class MuscleMenu < ApplicationRecord
  has_many :muscle_posts

  validates :name, presence: :true
end
