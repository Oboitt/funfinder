class Activity < ApplicationRecord
  has_many :likes
  has_many :theme_activities
  has_many :themes, through: :theme_activities
  has_many :users, through: :likes
  has_one_attached :photo
end
