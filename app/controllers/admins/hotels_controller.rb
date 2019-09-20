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
  	@hotel = Hotel.find(params[:id])
  end

  def new
    @hotel = Hotel.new
    @room_type = @hotel.room_types.build
    @plan = @room_type.plans.build
    @room = @room_type.rooms.build
  end

  def create
    @hotel = Hotel.new(hotel_params)
    @room =
    if @hotel.save
      flash[:success] = 'ホテルを保存しました'
      redirect_to admins_hotel_path(@hotel)
    else
      render 'new'
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  private
    def hotel_params
 	  params.require(:hotel).permit(:id, :name, :location,
   room_types_attributes:[:id, :name, :people_count, :_destroy],
   plans_attributes:[:id, :room_type_id, :charge, :_destroy],
   rooms_attributes:[:id, :room_type_id, :_destroy],
   hotel_photos_attributes: [:id, :image, :_destroy])
  end
end
