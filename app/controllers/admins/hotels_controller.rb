class Admins::HotelsController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@hotels = Hotel.all
  	if params[:search].present? && params[:search_by_location].present?
  		@hotels = @hotels.search(params[:search]).search_by_location(params[:search_by_location])
  	elsif params[:search].present?
  		@hotels = @hotels.search(params[:search])
    else  params[:search_by_location].present?
  		@hotels = @hotels.search_by_location(params[:search_by_location])
  	end
  end

  def show
  end

  def new
  end

  def edit
  end

  private
    def hotel_params
 	  params.require(:hotel).permit(:id, :name, :location,
   room_types_attributes:[:id, :name, :people_count, :_destroy],
    hotel_photos_attributes: [:id, :image, :_destroy])
  end
end
