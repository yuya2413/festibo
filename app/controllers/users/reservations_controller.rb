class Users::ReservationsController < ApplicationController

  before_action :authenticate_user!
    # URL直入力弾く
  before_action :ensure_correct_user, {only:[:new, :create, :index, :show]}
  def ensure_correct_user
    if current_user.id != params[:user_id].to_i
      redirect_to root_path
    end
  end

  def new
    @reservation = Reservation.new
    @hotel = Hotel.find(params[:hotel_id])
    @festival = Festival.find(params[:festival_id])
    #下記、空室検索、時間がないため今回は見送り
    #if params[:start_date].present? && params[:end_date].present?
    #  start_date = Date.parse(params[:start_date])
    #  end_date = Date.parse(params[:end_date])
    #  @reservationは入力したstart,end_dateに重複する他の予約として定義
    #  @rooms = Room.joins(:reservation).where.not('start_date <= ? or end_date >= ?', :start_date, :end_date)
    #end
  end



  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.end_date <= @reservation.start_date
      @festival = Festival.find(@reservation.festival_id)
      @room_type = RoomType.joins(:rooms).where(rooms: {id: @reservation.room_id}).first
      @hotel = Hotel.find(@room_type.hotel_id)
      flash[:danger] = '正しい日付を入力してください'
      render 'new'
    elsif Reservation.where(room_id: @reservation.room_id).where('end_date > ? and start_date < ?', @reservation.start_date, @reservation.end_date).exists?
      @festival = Festival.find(@reservation.festival_id)
      @room_type = RoomType.joins(:rooms).where(rooms: {id: @reservation.room_id}).first
      @hotel = Hotel.find(@room_type.hotel_id)
      flash[:danger] = 'すでに予約が埋まっています'
      render 'new'
    else
      nights = (@reservation.end_date - @reservation.start_date).to_i
      charge = @reservation.room.room_type.charge
      @reservation.total_charge = charge * nights
      @reservation.user_id = current_user.id
      @reservation.id = params[:id]
      @reservation.save
      flash[:success] = '予約が完了しました'
      redirect_to users_user_reservation_complete_path(current_user, @reservation)
    end
  end


  def complete
    @reservation = Reservation.find(params[:id])
  end


  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :festival_id, :room_id, :start_date, :end_date, :total_charge)
  end
  def hotel_params
    params.require(:hotel).permit(:id, :name, :address, :latitude, :longitude,
   room_types_attributes:[:id, :hotel_id, :name, :people_count, :charge, :_destroy,
   rooms_attributes:[:id, :room_type_id, :name, :_destroy]],
   hotel_photos_attributes: [:id, :image, :_destroy])
  end
  def festival_params
    params.require(:festival).permit(:id, :prefecture_id, :category_id, :name, :detail, :address, :start_date, :end_date, :value_1, :value_2, :value_3, :value_4, :value_5, festivals_categories_attributes:[:id, :festival_id, :category_id], festival_photos_attributes: [:id, :image_id, :_destroy])
  end
end
