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
    @room = @room_type.rooms.build
  end

  def create
    @hotel = Hotel.new(hotel_params)
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

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update(hotel_params)
      flash[:success] = 'ホテルを更新しました'
      redirect_to admins_hotel_path(@hotel)
    else
      render 'edit'
    end
  end

  def destroy
    hotel = Hotel.find(params[:id])
    hotel.destroy
    flash[:danger] = "ホテルを削除しました"
    redirect_to admins_hotels_path
  end

  private
    def hotel_params
 	  params.require(:hotel).permit(:id, :name, :location,
   room_types_attributes:[:id, :name, :people_count, :charge, :_destroy,
   rooms_attributes:[:id, :room_type_id, :name, :_destroy]],
   hotel_photos_attributes: [:id, :image, :_destroy])
  end
end
