class LikesController < ApplicationController
  before_action :authenticate_user!


    def index
      @liked_activities = current_user.activities.where("date_end >= ?", Date.today).last(5)
      @past_activites = current_user.activities.where("date_end < ?", Date.today).last(5)
    end



    def create
      @activity = Activity.find(params[:activity_id])
      @like = Like.new
      @like.activity = @activity
      @like.user = current_user
      if @like.save
      redirect_to likes_path, notice: 'Activité likée avec succès!'
      # render "themes_path", status: :unprocessable_entity
      end
    end

    def destroy
      @like = Like.find(params[:id])

      @like.destroy
      redirect_to like_path, notice: 'Like supprimé avec succès!', status: :see_other
    end

end
