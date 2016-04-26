class InviteCodesController < ApplicationController
  def create
    invite_code = current_user.campus.invite_codes.new(hash_code: SecureRandom.hex)
    respond_to do |format|
      if invite_code.save

        format.html { redirect_to :back }
        format.json { render json: invite_code}
      else
        format.html { redirect_to :back }
        format.json { render json: invite_code.errors, status: :unprocessable_entity }
      end
    end
  end
end
