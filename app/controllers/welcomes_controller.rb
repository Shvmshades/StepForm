	class WelcomesController < ApplicationController
  before_action :login? , only: [:show]
  
  def index
	end

	def show
		@user = current_user
  end
end