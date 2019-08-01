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

  def remove_project
    user_id = params[:user_id]
    project_id = params[:project_id]

    @user_project = UserStarredProject.find_by(user_id: user_id, project_id: project_id)

    if @user_project.delete
      render json: {message: 'Removed Project' }, status: :accepted
    else
      render json: {error: 'Could Not Remove Project' }, status: :not_acceptable
    end

  end

  def get_projects
    @user = User.find(params["user_id"])
    user_projects = @user.projects
    render json: user_projects
  end

  def check_star
    starred = false
    project_id = params[:project_id].to_i
    @user = User.find(params[:user_id])
    @user_projects = @user.projects
    @user_projects.each do |project|
      if project[:id] == project_id
        starred = true
      end
    end

    if starred
      render json: {status: 'Star'}
    else
      render json: {status: 'None'}
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
      :email_address, :default_country, :theme1, :theme2, :theme3)
  end

end
