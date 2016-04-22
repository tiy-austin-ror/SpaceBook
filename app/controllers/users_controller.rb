class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = get_user
  end

  def new
    @user = User.new
  end

  def create
    if params.fetch(:user).fetch(:password) == params.fetch(:user).fetch(:password_confirmation)
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "User created!"
        redirect_to :back
      else
        flash[:danger] = "All fields are required"
        redirect_to :back
      end
    else
      flash[:danger] = "Paswords must match"
      redirect_to :back
    end
  end

  def edit
    @user = get_user
  end

  def updated
    @user = get_user
    if @user.update(user_params)
      redirect_to @user
    else
      flash[:danger] = "There was an issue with the changes being made"
      redirect_to :back
    end
  end

  def destroy
    @user = get_user

    if @user.destroy
      redirect_to :users_path
    else
      flash[:danger] = "There was an issue finding that user"
      redirect_to :back
    end
  end

private
  def get_user
    User.find(params.fetch(:id))
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :name, :phone_num, :profile_pic, :email)
  end
end
