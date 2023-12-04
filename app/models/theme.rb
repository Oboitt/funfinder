class Theme < ApplicationRecord
  has_many :theme_activities
  has_many :activities, through: :theme_activities
  has_many :preferences
  has_many :users, through: :preferences
end
