class Theme < ApplicationRecord
  has_one_attached :photo
  has_many :theme_activities
  has_many :activities, through: :theme_activities
  has_many :preferences
  has_many :users, through: :preferences
end
