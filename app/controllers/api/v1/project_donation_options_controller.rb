class Api::V1::ProjectDonationOptionsController < ApplicationController

  def index
    @donationOptions = ProjectDonationOption.all
    render json: @donationOptions
  end
end
