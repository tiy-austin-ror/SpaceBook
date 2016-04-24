class UsersController < ApplicationController
  before_action :admin_validation, only: [:admin_dashboard]
  before_action :get_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    if params.fetch(:user).fetch(:password) == params.fetch(:user).fetch(:password_confirmation)
      @user = User.new(user_params)
      save_for_html_json(@user, "new") { user_path(@user) }
    else
      flash[:danger] = "Passwords must match"
      redirect_to :back
    end
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    save_for_html_json(@user, "edit") { user_path(@user) }
  end

  def destroy
    if @user.destroy
      redirect_to :users_path
    else
      flash[:danger] = "There was an issue finding that user"
      redirect_to :back
    end
  end

  def admin_dashboard
    @user = current_user
  end

private
  def get_user
    @user = User.find(params.fetch(:id))
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :name, :phone_num, :profile_pic, :email)
  end
end
