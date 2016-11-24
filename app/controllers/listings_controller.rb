class ListingsController < ApplicationController
  def index
    @listings = Listing.page(params[:page]).per_page(20).order('price DESC')
  end

  def show
    @listings = Listing.find(params[:id])
    @amenities = Amenity.find_by(listing_id: params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @listings = Listing.find(params[:id])
  end

  def update
    params.permit!
    Listing.update(params[:id], params[:listing])
    @listings = Listing.page(params[:page]).per_page(20).order('price DESC')
    redirect_to("/listings")
  end

  def destroy
    Listing.find(params[:id]).destroy
    redirect_to listings_path, notice: "Deleted!"
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :city, :address)
  end
end
