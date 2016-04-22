class ForbiddenAuth < StandardError
end

class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ForbiddenAuth, with: :forbidden_auth

  private

  API_MESSAGE = {not_found: {status: 404, message: "Resource not found"},
              bad_input: {status: 400, message: "Invalid input "},
             forbidden: {status:403, message: "Forbbiden, must supply valid user credentials"}}

  def admin_validation
    raise ForbiddenAuth unless current_user.admin
  end


  def forbidden_auth
    respond_to do |format|
      format.html do
        flash[:danger] = API_MESSAGE[:forbidden][:message]
        redirect_to "/sign_in"
      end
      format.json do
        render json: API_MESSAGE[:bad_input], status: 400
      end
    end
  end

end
