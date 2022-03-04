class MuscleMenu < ApplicationRecord
  has_many :muscle_post

  validates :name, presence: :true
end
