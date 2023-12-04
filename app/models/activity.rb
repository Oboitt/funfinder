class Activity < ApplicationRecord
  has_many :likes
  has_many :theme_activities
  has_many :themes, through: :theme_activities
  has_many :users, through: :likes
  geocoded_by :address
  after_create :set_date_activities
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
  def set_date_activities
    if self.date_begin == nil && self.date_end == nil
      self.date_begin = Date.today
      self.date_end = Date.today
      self.save
    end
  end
  def set_photo_activities
    if self.photo == nil
      self.photo = "app/assets/images/funfinder.jpg"
      self.save
    end
  end
end
