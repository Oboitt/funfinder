class ActivitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.all

    if params[:date_begin].present?
      @activities = @activities.where('date_begin >= ?', params[:date_begin].to_date)
    end

    if params[:themes].present?

      @activities = @activities.where(category: params[:themes])
    end

    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { activity: activity }),
        marker_html: render_to_string(partial: "marker", locals: { activity: activity, id: activity.id })
      }
    end
  end


  def show
    # @theme_activities = ThemeActivity.where(activity_id: @activity.id)
    # @likes = Like.where(activity_id: @activity.id)
  end

  # def create
  #   @activity = Activity.new(activity_params)
  #   if @activity.save
  #   redirect_to activity_path(@activity)

  # end

  # def destroy
  #   @activity.destroy
  #   redirect_to activities_path
  # end

  private

  # def activity_params
  #   params.require(:activity).permit(:name, :brand, :address, :content, :date_begin, :date_end, :website, :photo)
  # end

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :body, :photo)
  end
end
