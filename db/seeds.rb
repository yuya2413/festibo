# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Adminを生成
Admin.create!(  email: "#{(0...8).map{ ('A'..'Z').to_a[rand(26)] }.join}@seeds.com",
				password: 'password',
				password_confirmation: 'password'
	)
Admin.create!(  email: "admin@festibo.com",
				password: 'password',
				password_confirmation: 'password'
	)

# Categoryを生成
Category.create!(name: "未定")
categories = %w[花火 子供向け 伝統 奇祭 水上 カーニバル 和洋折衷 スタンダード 出店 踊り 衣装 浴衣 爆竹]
categories.each { |w| Category.create!(name: w) }

# Favoriteを生成

# FestivalPhotoを生成
27.times do |n|
	festival_id = rand(1..27)
	image_id = ["AMEMAN314011_TP_V.jpg",
		"anjyuomaturiIMG_1546_TP_V4.jpg",
		"IMARI0I9A0040_TP_V4.jpg",
		"IMARI20160807152719_TP_V4.jpg",
	    "IMARIB20160807430416_TP_V.jpg",
	    "PAK85_spballsukuishiterusyoune_TP_V.jpg",
	    "PKST0I9A2332_TP_V.jpg",
	    "PKST0I9A2587_TP_V.jpg"
	]
	FestivalPhoto.create!(
		festival_id: festival_id,
		image_id: image_id.sample
		)
end

# Festivalを生成
27.times do |n|
	name = "祭り-#{n+2}"
	detail = "祭り-#{n+2}の説明"
	location = "祭り-#{n+2}の開催地"
	start_date = Faker::Date.between(from: 50.days.from_now, to: 300.days.from_now)
	end_date = start_date + rand(1..7)
	Festival.create!(
		prefecture_id: rand(1..47),
		name: name,
		detail: detail,
		location: location,
		start_date: start_date,
		end_date: end_date,
		value_1: rand(0..4),
		value_2: rand(0..4),
		value_3: rand(0..4),
		value_4: rand(0..4),
		value_5: rand(0..4)
		)
end


# FestivalsCategoryを生成
81.times do |n|
	FestivalsCategory.create!(
		festival_id: rand(1..27),
		category_id: rand(1..13),
		)
end

# HotelPhotoを生成
54.times do |n|
	festival_id = rand(1..27)
	image_id = [
		"gunkanjimaFTHG4531_TP_V.jpg",
		"hiroto_htmachi_TP_V.jpg",
		"KAI427010_TP_V.jpg",
		"KAI427012_TP_V.jpg", "MSA0I9A5161_TP_V.jpg",
		"MZ18063DSCF4751_TP_V.jpg",
		"SAYAPAKU4851_TP_V.jpg",
		"SAYAPAKU5460_TP_V.jpg",
		"tokunoshimaIMGL4324_TP_V.jpg",
		"YAMA_DSC0929_TP_V.jpg",
		"ZUhaikyoDSC_1190_TP_V.jpg"
	]
	FestivalPhoto.create!(
		festival_id: festival_id,
		image_id: image_id.sample
		)
end

# Hotelを生成
27.times do |n|
	name = "ホテル-#{n+2}"
	location = "ホテル-#{n+2}の開催地"
	Hotel.create!(
		name: name,
		location: location,
		)
end

# RoomTypeを生成
81.times do |n|
	bed_type = %w[シングル ダブル キング クイーン]
	bed_count = rand(1..2).to_s
	RoomType.create!(
		hotel_id: rand(1..27),
		name: bed_type.sample + bed_count + "台",
		people_count: rand(1..5)
		)
end

# Planを生成
27.times do |n|
	Plan.create!(
		room_type_id: rand(1..54),
		charge: (rand (1..10)) *1000,
		start_date: Faker::Date.between(from: 200.days.ago, to: 2.days.from_now)
		)
end

# Prefectureを生成
47.times do |n|
	Prefecture.create!(
		name: n+=1
		)
end

# Roomを生成
162.times do |n|
Room.create!(
	room_type_id: rand(1..81)
	)
end

# Userを生成
27.times do |n|
	last_name = %w[山口 安倍 後藤 伊藤 斎藤 高橋 高田 高山 山田 藤本 藤井 藤崎 東久邇宮 プルースト]
	first_name = %w[家康 義経 家光 光圀 忠家 義久 阿弖流為 サルヴァドール]
	email = "#{(0...8).map{ ('A'..'Z').to_a[rand(26)] }.join}@seeds.com"
	password = "password"
	User.create!(
		last_name: last_name.sample,
		first_name: first_name.sample,
		status: rand(0..2),
		email: email,
		password: password,
		password_confirmation: password
		)
end

# 生成しないDB,ReservationHistory, Reservation,Review












