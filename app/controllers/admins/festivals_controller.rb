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

  def new
    @festival = Festival.new
    @festival.festivals_categories.build
    @category = Category.new
  end

  def create
    @festival = Festival.new(festival_params)
    if params[:category?] && params[:category][:name].present?
      @festival.festivals_categories.category = Category.new(category_params)
    end
    if @festival.save
      flash[:success] = '祭りを保存しました'
      redirect_to admins_festival_path(@festival)
    else
      render 'new'
    end
  end

  def edit
    @festival = Festival.find(params[:id])
    @category = Category.new
  end

  def update
    @festival = Festival.find(params[:id])
    if params[:category?] && params[:category][:name].present?
      @festival.festivals_categories.category = Category.new(category_params)
    end
    if @festival.update(festival_params)
      flash[:success] = '祭りを更新しました'
      redirect_to admins_festival_path(@festival)
    else
      render 'edit'
    end
  end

  def destroy
    festival = Festival.find(params[:id])
    festival.destroy
    flash[:danger] = "祭りを削除しました"
    redirect_to admins_festivals_path
  end

  private
  def festival_params
 	  params.require(:festival).permit(:id, :prefecture_id, :name, :detail, :location, :start_date, :end_date,
   :value_1, :value_2, :value_3, :value_4, :value_5,
   festivals_categories_attributes:[:id, :festival_id, :category_id, :_destroy],
    festival_photos_attributes: [:id, :image_id, :_destroy])
  end
  def category_params
    params.require(:category).permit(:id, :name)
  end
end
