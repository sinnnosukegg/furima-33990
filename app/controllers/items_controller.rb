class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to :index
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
