class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @activities = Activity.order(id: :desc).limit(5)

    # if params[:date_begin].present?
    #   raise
    #   sql_subquery = <<~SQL
    #     activities.date_begin ILIKE :query
    #     OR activities.address ILIKE :query
    #   SQL
    #   @activities = @activities.where(sql_subquery, query: "%#{params[:date_begin]}%")
    # end

  end
end
