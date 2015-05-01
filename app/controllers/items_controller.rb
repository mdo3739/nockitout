class ItemsController < ApplicationController
	def create
		@new_item = current_user.items.build(item_params)
		if @new_item.save
			flash[:notice] = "Item saved"
			redirect_to user_path(current_user)
		else
			flash[:error] = "Item not saved, please try again"
			redirect_to user_path(current_user)
		end
	end

	def destroy
		@item = Item.find(params[:id])
		if @item.destroy
			flash[:notice] = "check!"
			redirect_to user_path(current_user)
		else
			flash[:error] = "didnt work :("
			redirect_to user_path(current_user)
		end
	end

	private

	def item_params
		params.require(:item).permit(:name, :completed)
	end
end
