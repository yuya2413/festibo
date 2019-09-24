class Users::HotelsController < ApplicationController
  def index
  	@festival = Festival.find(params[:id])
  	@hotels = Hotel.all
  end

  def show
  end

  private
  def festival_params
 	params.require(:festival).permit(:id, :prefecture_id, :category_id, :name, :detail, :address, :start_date, :end_date, :value_1, :value_2, :value_3, :value_4, :value_5, festivals_categories_attributes:[:id, :festival_id, :category_id], festival_photos_attributes: [:id, :image_id, :_destroy])
  end
  def hotel_params
 	params.require(:hotel).permit(:id, :name, :address, :latitude, :longitude,
   room_types_attributes:[:id, :name, :people_count, :charge, :_destroy,
   rooms_attributes:[:id, :room_type_id, :name, :_destroy]],
   hotel_photos_attributes: [:id, :image, :_destroy])
  end
end
