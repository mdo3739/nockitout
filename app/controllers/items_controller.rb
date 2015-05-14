class ItemsController < ApplicationController
	def create
		@item = current_user.items.build(item_params)
		@new_item = current_user.items.build(item_params)
		@item.save

		respond_to do |format|
			format.html
			format.js
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.completed =  true
		@item.save
		
		respond_to do |format|
			format.html
			format.js { render "destroy.js.erb"}
		end
	end

	def update
		@item = Item.find(params[:id])
		@item.completed = false
		@item.save

		respond_to do |format|
			format.html
			format.js
		end
	end

	private

	def item_params
		params.require(:item).permit(:name, :completed, :archive)
	end
end
