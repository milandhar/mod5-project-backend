class Api::V1::UserStarredProjectsController < ApplicationController
  # skip_before_action :authorized, only: [:create, :index, :update]
  def index
    @allStars = UserStarredProject.all
    render json: @allStars
  end
end
