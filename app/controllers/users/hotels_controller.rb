class Users::HotelsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@festival = Festival.find(params[:id])
    @prefecture_id = @festival.prefecture_id
  	@hotels = Hotel.where(prefecture_id: @prefecture_id)
  end

  private
  def festival_params
 	params.require(:festival).permit(:id, :prefecture_id, :category_id, :name, :detail, :address, :start_date, :end_date, :value_1, :value_2, :value_3, :value_4, :value_5, festivals_categories_attributes:[:id, :festival_id, :category_id], festival_photos_attributes: [:id, :image_id, :_destroy])
  end
  def hotel_params
 	params.require(:hotel).permit(:id, :prefecture_id, :name, :address, :latitude, :longitude,
   room_types_attributes:[:id, :name, :people_count, :charge, :_destroy,
   rooms_attributes:[:id, :room_type_id, :name, :_destroy]],
   hotel_photos_attributes: [:id, :image, :_destroy])
  end
end
