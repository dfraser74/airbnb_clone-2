class ListingsController < ApplicationController
  def index

    if params[:search] != nil
      @search = Search.find(params[:search])
      #byebug
      @listings = Listing.available.low_price(@search.low_price).high_price(@search.high_price).city(@search.city).max_occupancy(@search.max_occupancy).number_of_rooms(@search.number_of_rooms).has_amenity(@search.amenities).page(params[:page]).per_page(20)#.order('created_at DESC')

      #@listings = Listing.has_amenity(@search.amenities).page(params[:page]).per_page(20)#.order('created_at DESC')
    else
      @listings = Listing.page(params[:page]).per_page(20).order('created_at DESC')
    end

  end

  def show
    @listings = Listing.find(params[:id])
    @amenities = Amenity.find_by(listing_id: params[:id])
  end

  def new
  end

  def create
    params.permit!
    new_listing = Listing.create(params[:listing])
    new_listing.user_id = current_user.id
    new_listing.save
    redirect_to("/listings")
  end

  def edit
    @listings = Listing.find(params[:id])
  end

  def update
    params.permit!
    Listing.update(params[:id], params[:listing])
    redirect_to("/listings")
  end

  def destroy
    Listing.find(params[:id]).destroy
    redirect_to listings_path, notice: "Deleted!"
  end

end
