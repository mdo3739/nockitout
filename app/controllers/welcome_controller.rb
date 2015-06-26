class WelcomeController < ApplicationController
	def index
		@new_user = User.new
		authorize @new_user
	end
end