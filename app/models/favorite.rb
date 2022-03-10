class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :muscle_post
end
