class Users::FestivalsController < ApplicationController

  def index
  	@festivals = Festival.all
  end

  def show
  	@festival = Festival.find(params[:id])
  end

  private
  def festival_params
 	params.require(:festival).permit(:id, :prefecture_id, :category_id, :name, :detail, :location, :start_date, :end_date, :value_1, :value_2, :value_3, :value_4, :value_5)
  end
end
