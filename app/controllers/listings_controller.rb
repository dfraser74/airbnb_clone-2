class ListingsController < ApplicationController
  def index
    @listings = Listing.page(params[:page]).per_page(20).order('number_of_rooms DESC')
  end

  def show
    @listings = Listing.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
