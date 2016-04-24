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
    raise ForbiddenAuth unless current_user && current_user.admin
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

  def save_for_html_json(object, render_string)
    respond_to do |format|
      if object.save
        format.html { redirect_to yield }
        format.json { render json: object}
      else
        format.html { render action: render_string }
        format.json { render json: object.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_html_json(object, redirect_path)
      respond_to do |format|
        if object.destroy
          format.html { redirect_to redirect_path}
          format.json { head :no_content }
        else
          format.html { redirect_to :back }
          format.json { head :no_content }
        end
      end
  end

end
