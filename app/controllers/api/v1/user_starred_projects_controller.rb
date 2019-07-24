class Api::V1::UserStarredProjectsController < ApplicationController
  # skip_before_action :authorized, only: [:create, :index, :update]
  def index
    @allStars = UserStarredProject.all
    render json: @allStars
  end

  def create
    @userStar = UserStarredProject.new(user_star_params)
    if @userStar.save
      render json: @userStar, status: :created
    else
      ender json: {error: 'failed to create user star' }, status: :not_acceptable
    end
  end


  private

  def user_star_params
    params.permit(:projectId, :userId)
  end

end
