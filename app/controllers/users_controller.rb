class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  def auth
    # Extract email and password from the parameters
    data = params.permit(:user_email, :user_password)
    user_email = data[:user_email]
    user_password = data[:user_password]

    # Find the user by email
    @user = User.find_by(user_email:)

    if @user
      if @user.user_password == user_password
        render json: { id: @user.id, message: 'Authentication successful' }, status: :ok
      end
    else
      # If authentication fails, respond with an error message
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:user_name, :user_email, :user_password)
  end
end
