class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
     @activities = Activity.last(5)
     @activity = Activity.new
  end
end
