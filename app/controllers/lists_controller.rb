class ListsController < ApplicationController
  before_action :require_logged_in!
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = @current_user.id
    if @list.save
      redirect_to lists_url
    else
      flash.now[:errors] = @list.errors.full_messages
      render new
    end
  end

  def index
    @lists = List.where(["user_id = '?'", @current_user.id])
    @items = Item.all
  end

  def destroy
    list = List.find(params[:id])
    list.items.destroy_all
    list.destroy
    redirect_to lists_url
  end

  def show
    @list = @current_user.lists.all
  end

  private
  def list_params
    params.require(:list).permit(:title)
  end
end
