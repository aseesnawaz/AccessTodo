class ItemsController < ApplicationController
  def create
    item = Item.new(item_params)
    item.save
    flash[:errors] = item.errors.full_messages
    redirect_to lists_url
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to lists_url
  end

private
  def item_params
    params.require(:item).permit(:item, :list_id)
  end
end
