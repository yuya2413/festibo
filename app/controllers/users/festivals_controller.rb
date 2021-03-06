class Users::FestivalsController < ApplicationController

  def index
  	@festivals = Festival.all
  	if params[:start_date].present?
  		start_date = Date.parse(params[:start_date])
  		from = start_date - 7
  		to = start_date + 8
  	    @festivals = @festivals.where(start_date: from...to)
    end
    if params[:prefecture_id].present? && params[:category_id].present?
      @category_id = params[:category_id]
      @festivals_categories = FestivalsCategory.where(category_id: @category_id)
      @festivals = @festivals.where(["prefecture_id = ?", "#{params[:prefecture_id]}"]).where(festivals_categories: @festivals_categories)
    elsif params[:prefecture_id].present?
      @festivals = @festivals.where(["prefecture_id = ?", "#{params[:prefecture_id]}"])
    elsif params[:category_id].present?
      @category_id = params[:category_id]
      @festivals_categories = FestivalsCategory.where(category_id: @category_id)
      @festivals = Festival.where(festivals_categories: @festivals_categories)
    else
    	render :index
  	end
  end

  def show
  	@festival = Festival.find(params[:id])
  end

  private
  def festival_params
 	params.require(:festival).permit(:id, :prefecture_id, :category_id, :name, :detail, :address, :start_date, :end_date, :value_1, :value_2, :value_3, :value_4, :value_5, festivals_categories_attributes:[:id, :festival_id, :category_id], festival_photos_attributes: [:id, :image, :_destroy])
  end
end
