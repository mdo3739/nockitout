class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@new_item = Item.new
		@new_item.user = current_user
		@items = current_user.items.where(completed: false)
		@completed_items = current_user.items.where(completed: true)
	end
end
