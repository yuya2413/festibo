class ChangeManyColumns < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :users, :last_name, false
  	change_column_null :users, :first_name, false
  	change_column_null :users, :status, false
    change_column_default :users, :status, 0
    change_column_null :categories, :name, false
    #change_column_null :favorites, :user_id, false
    #change_column_null :favorites, :festival_id, false
    #change_column_null :favorites, :festival_id, false
    add_reference :festival_photos, :festival, foreign_key: true
    change_column_null :festival_photos, :festival_id, false
    change_column_null :festival_photos, :image_id, false
    add_reference :festivals, :prefecture, foreign_key: true
    change_column_null :festivals, :prefecture_id, false
    change_column_null :festivals, :category_id, false
    change_column_null :festivals, :name, false
    change_column_null :festivals, :location, false
    change_column_null :festivals, :start_date, false
    change_column_null :festivals, :end_date, false
    change_column_null :festivals, :value_1, false
    change_column_null :festivals, :value_2, false
    change_column_null :festivals, :value_3, false
    change_column_null :festivals, :value_4, false
    change_column_null :festivals, :value_5, false
    change_column_default :festivals, :value_1, 2
    change_column_default :festivals, :value_2, 2
    change_column_default :festivals, :value_3, 2
    change_column_default :festivals, :value_4, 2
    change_column_default :festivals, :value_5, 2
    add_reference :hotel_photos, :hotel, foreign_key: true
    change_column_null :hotel_photos, :hotel_id, false
    change_column_null :hotel_photos, :image_id, false
    change_column_null :hotels, :name, false
    change_column_null :hotels, :location, false
    change_column_null :prefectures, :name, false
    #change_column_null :reviews, :user_id, false
    #change_column_null :reviews, :festival_id, false
    #change_column_null :reviews, :title, false
    #change_column_null :reviews, :body, false
    #change_column_null :plans, :room_type_id, false
    #change_column_null :plans, :charge, false
    #change_column_null :plans, :start_date, false
    add_reference :reservations, :room, foreign_key: true
    change_column_null :reservations, :user_id, false
    change_column_null :reservations, :room_id, false
    #change_column_null :reservations, :plan_id, false
    change_column_null :reservations, :start_date, false
    change_column_null :reservations, :end_date, false
    change_column_null :reservations, :total_charge, false
    change_column_null :room_types, :hotel_id, false
    change_column_null :room_types, :name, false
    change_column_null :room_types, :people_count, false
    change_column_null :rooms, :room_type_id, false
    #change_column_null :reservation_histories, :user_id, false
    #change_column_null :reservation_histories, :festival_id, false
    #change_column_null :reservation_histories, :hotel_id, false
    #change_column_null :reservation_histories, :festival_name, false
    #change_column_null :reservation_histories, :festival_location, false
    #change_column_null :reservation_histories, :hotel_name, false
    #change_column_null :reservation_histories, :hotel_location, false
    #change_column_null :reservation_histories, :room_information, false
    #change_column_null :reservation_histories, :start_date, false
    #change_column_null :reservation_histories, :end_date, false
    #change_column_null :reservation_histories, :total_charge, false
  end
end
