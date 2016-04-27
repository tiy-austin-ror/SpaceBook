class CompaniesController < ApplicationController
  def show
    @company = current_user.company
  end

  def edit
    @company = current_user.company
  end

  def update
    @company = current_user.company
    if @company.update_attributes(company_param)
      redirect_to :action => 'show', :id => @company
    else
      render edit
    end
  end

  def company_param
     params.require(:company).permit(:user_id, :campus_id, :index, :primary_color, :secondary_color, :snippet)
  end
end
