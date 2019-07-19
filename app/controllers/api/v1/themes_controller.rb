class Api::V1::ThemesController < ApplicationController
  # skip_before_action :authorized, only: [:create, :index, :update]
  def index
    @themes = Theme.all
    render json: @themes
  end

end
