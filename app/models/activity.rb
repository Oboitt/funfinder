class Activity < ApplicationRecord
  has many :likes
  has many :theme_activities
  has many :themes, through: :theme_activities
  has many :users, through: :likes
end
