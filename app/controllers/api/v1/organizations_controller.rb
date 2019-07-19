class Api::V1::OrganizationsController < ApplicationController
  # skip_before_action :authorized, only: [:create, :index, :update]
  def index
    @organizations = Organization.all
    render json: @organizations
  end

end
