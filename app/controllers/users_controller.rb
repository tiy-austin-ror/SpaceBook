class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = get_user
  end

  def new
    @user = get_user
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to root_path notice: "User created!"
    else
      flash.now[:alert] = "All fields are required"
      render :new
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
      flash.now[:alert] = "There was an issue"
      redirect_to :back
    end
  end

  def destroy
    @user = get_user

    if @user.destroy
      redirect_to :users_path
    else
      flash.now[:alert] = "There was an issue"
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
