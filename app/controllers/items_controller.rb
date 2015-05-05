class ItemsController < ApplicationController
	def create
		@item = current_user.items.build(item_params)
		@new_item = Item.new
		@new_item.user = current_user
		if @item.save
			flash[:notice] = "Item saved"
		else
			flash[:error] = "Item not saved, please try again"
		end

		respond_to do |format|
			format.html
			format.js
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.completed =  true
		if @item.save
			flash[:notice] = "check!"
		else
			flash[:error] = "didnt work :("
		end
		
		respond_to do |format|
			format.html
			format.js { render "destroy.js.erb"}
		end
	end

	private

	def item_params
		params.require(:item).permit(:name, :completed)
	end
end
