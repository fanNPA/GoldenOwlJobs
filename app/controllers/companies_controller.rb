class CompaniesController < ApplicationController
  def show
  	@employer = Employer.find(params[:id])
  end

  def index
  	@employers = Employer.all
  end

  def info
  	render 'services'
  end
end
