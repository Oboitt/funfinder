class Activity < ApplicationRecord
  has_many :likes
  has_many :theme_activities
  has_many :themes, through: :theme_activities
  has_many :users, through: :likes
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
