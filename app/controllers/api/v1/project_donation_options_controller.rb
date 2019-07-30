class Api::V1::ProjectDonationOptionsController < ApplicationController

  def index
    @allDonationOptions = ProjectDonationOption.all
    render json: @allDonationOptions
  end

  def find
    project_id = params[:project_id]
    @donationOptions = ProjectDonationOption.where(project_id: project_id)
    render json: @donationOptions
  end

end
