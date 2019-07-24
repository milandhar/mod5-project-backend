class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create, :index, :update]

  def index
    @users = User.all
    render json: @users
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.new(user_params)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    @user.password_digest = BCrypt::Password.create(params[:password], cost: cost)
    if @user.save
      @token = encode_token(user_id: @user.id)
      render json: { user:   UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: {error: 'failed to create user' }, status: :not_acceptable
    end
  end


  def update
    @user = User.find(user_params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: {error: 'failed to update user' }, status: :not_acceptable
    end
  end


  private

  def user_params
    params.permit(:id, :username, :password, :first_name, :last_name,
      :email_address, :theme1, :theme2, :theme3)
  end

end
