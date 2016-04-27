class UsersController < ApplicationController
  before_action :company_validation, except: [:index]
  before_action :get_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @hash_code = params[:hash_code]
  end

  def create
    @user_code = InviteCode.find_by(hash_code: params[:hash_code])
    @user = User.new(user_params)
    @user.company_id = @user_code.campus.company.id
    if @user_code.nil?
      flash.now[:danger] = "Invalid invite link. This is a very exclusive app, you must be invited first!!"
      render "new"
    else
      if params.fetch(:user).fetch(:password) == params.fetch(:user).fetch(:password_confirmation)
        save_for_html_json(@user, "new") do
          CampusUser.create(campus_id: @user_code.campus_id, user_id: @user.id)
          @user_code.destroy
          guest_root_url
        end
      else
        flash[:danger] = "Passwords must match"
        redirect_to :back
      end
    end
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    save_for_html_json(@user, "edit") { user_path(@user) }
  end

  def destroy
    destroy_html_json(@user, users_path)
  end

  def admin_dashboard
    @user = current_user
    @invite_code = InviteCode.new
  end

private
  def get_user
    @user = User.find(params.fetch(:id))
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :name, :phone_num, :profile_pic)
  end
end
