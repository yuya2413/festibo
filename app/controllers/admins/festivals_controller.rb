class Admins::FestivalsController < ApplicationController
	before_action :authenticate_admin!
  def index
  	@festivals = Festival.all
  	@festivals = @festivals.search(params[:search])
  	if params[:start_date].present?
  		start_date = Date.parse(params[:start_date])
  		from = start_date - 7
  		to = start_date + 8
  	    @festivals = @festivals.where(start_date: from...to)
    end
  	if params[:prefecture_id].present? && params[:category_id].present?
  		@festivals = @festivals.where(["prefecture_id = ?", "#{params[:prefecture_id]}"]).where(["category_id = ?", "#{params[:category_id]}"])
  	elsif params[:prefecture_id].present?
  		@festivals = @festivals.where(["prefecture_id = ?", "#{params[:prefecture_id]}"])
    elsif params[:category_id].present?
    	@festivals = @festivals.where(["category_id = ?", "#{params[:category_id]}"])
    else
    	render :index
  	end
  end

  def show
  end

  def new
  end

  def edit
  end

  private
  def festival_params
 	params.require(:festival).permit(:id, :prefecture_id, :category_id, :name, :detail, :location, :start_date, :end_date, :value_1, :value_2, :value_3, :value_4, :value_5, festival_photos_attributes: [:id, :image_id, :_destroy])
  end
end
