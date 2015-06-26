class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@new_item = Item.new
		@new_item.user = current_user
		@items = current_user.items.all
		@completed_items = current_user.items.where(completed: true, archive: false)
		@open_items = current_user.items.where(completed: false, archive: false)
	end
end
