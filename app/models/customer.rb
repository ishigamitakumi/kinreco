class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :muscle_posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }
  validates :introduction_text,length: {maximum: 20}
  validates :experience_years,numericality: { only_integer: true }

  enum sex: { "非公開": 0, "男性": 1, "女性": 2}
  enum age: { "未設定": 0, "10代": 1, "20代": 2, "30代": 3, "40代": 4, "50代": 5, "60代以降": 6 }

  def get_profile_image
    profile_image.attached? ? profile_image : 'no_image.jpg'
  end

end
