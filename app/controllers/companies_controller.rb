class CompaniesController < ApplicationController
  def show
    @company = current_user.company
  end
 #TODO: Need to add image uploader on edit page
 # <%= f.attachment_field :profile_image %>
  def edit
    @company = current_user.company
  end
end
