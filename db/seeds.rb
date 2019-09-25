# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Adminを生成
#Admin.create!(  email: "#{(0...8).map{ ('A'..'Z').to_a[rand(26)] }.join}@seeds.com",
#				password: 'password',
#				password_confirmation: 'password'
#	)
Admin.create!(  email: "admin@festibo.com",
				password: 'password',
				password_confirmation: 'password'
	)

# Categoryを生成
Category.create!(name: "ダイナミック")
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
	address = "祭り-#{n+2}の開催地"
	start_date = Faker::Date.between(from: 50.days.from_now, to: 300.days.from_now)
	end_date = start_date + rand(1..7)
	Festival.create!(
		prefecture_id: rand(1..47),
		name: name,
		detail: detail,
		address: address,
		start_date: start_date,
		end_date: end_date,
		value_1: rand(0..4),
		value_2: rand(0..4),
		value_3: rand(0..4),
		value_4: rand(0..4),
		value_5: rand(0..4)
		)
end

# id=28, 青森ねぶた祭り
Festival.create(
	prefecture_id: "#{2}",
	name: "ねぶた祭り",
	detail: "青森県青森市で8月2日から7日に開催される夏祭りであり、毎年、延べ200万人以上の観光客が訪れる。1980年に国の重要無形民俗文化財に指定された。",
	address: "青森県青森市長島1丁目1−1",
	start_date: "2019-08-1 09:00:00",
	end_date: "2019-08-7 09:00:00",
	value_1: 0,
	value_2: 0,
	value_3: 0,
	value_4: 2,
	value_5: 2,
	latitude: "#{40.824811}",
	longitude: "#{140.740531}"
	)

# id=29, 秋田竿頭祭り
Festival.create(
	prefecture_id: "#{5}",
	name: "竿頭祭り",
	detail: "竿燈まつりは、真夏の病魔や邪気を払う、ねぶり流し行事として宝暦年間にはその原型となるものが出来ていたという。",
	address: "秋田県秋田市中通7丁目1-2",
	start_date: "2020-08-03 09:00:00",
	end_date: "2020-08-06 09:00:00",
	value_1: 1,
	value_2: 0,
	value_3: 1,
	value_4: 2,
	value_5: 2,
	latitude: "#{39.716698}",
	longitude: "#{140.128896}"
	)

# id=30, さっぽろ雪祭り
Festival.create(
	prefecture_id: "#{1}",
	name: "さっぽろ雪祭り",
	detail: "真っ白い雪と透き通る氷だけによって創り出された芸術品は、制作者の思いをのせて観客の皆さんにきっと何かを伝えます。この大きさでこれだけ精巧に表現できるのが「さっぽろ雪まつり」最大の魅力です！！",
	address: "北海道札幌市中央区大通西５丁目",
	start_date: "2020-01-31 09:00:00",
	end_date: "2020-02-11 09:00:00",
	value_1: 0,
	value_2: 1,
	value_3: 1,
	value_4: 1,
	value_5: 1,
	latitude: "#{43.060447}",
	longitude: "#{141.348872}"
	)

# 3つの祭りに対してFestivalsCategoryを生成
9.times do |n|
	FestivalsCategory.create!(
		festival_id: rand(28..30),
		category_id: rand(1..13),
		)
end

# FestivalsCategoryを生成
81.times do |n|
	FestivalsCategory.create!(
		festival_id: rand(1..27),
		category_id: rand(1..13),
		)
end

# Hotelを生成
27.times do |n|
	name = "ホテル-#{n+2}"
    address = "ホテル-#{n+2}の開催地"
	Hotel.create!(
		name: name,
		address: address,
		)
end

# Hotel for ねぶた祭り id=28-37
Hotel.create(name: "ホテル青森",
	address: "青森県青森市安方2-4-12",
	latitude: "#{40.829148}",
	longitude: "#{140.740639}")
Hotel.create(name: "ゲストハウスAOMORI",
	address: "青森県青森市大字浅虫字坂本51-1",
	latitude: "#{40.897072}",
	longitude: "#{140.859870}")
Hotel.create(name: "ペンション木村",
	address: "青森県青森市堤町1-1-23",
	latitude: "#{40.825379}",
	longitude: "#{140.755433}")
Hotel.create(name: "ホテルNEBUTA",
	address: "青森県青森市本町2-1-26",
	latitude: "#{40.827374}",
	longitude: "#{140.746376}")
Hotel.create(name: "ゲストハウス科学研究所",
	address: "青森県青森市新町1-1-24",
	latitude: "#{40.828627}",
	longitude: "#{140.735829}")
Hotel.create(name: "民宿ハクナマタタ",
	address: "青森県青森市橋本1-3-14",
	latitude: "#{40.823517}",
	longitude: "#{140.752355}")
Hotel.create(name: "家系ラーメン武蔵屋青森店",
	address: "青森県青森市長島1-6-6",
	latitude: "#{40.823556}",
	longitude: "#{140.744795}")
Hotel.create(name: "ホテル味噌カレー牛乳ラーメン",
	address: "青森県青森市橋本1-1-7",
	latitude: "#{40.825216}",
	longitude: "#{140.751052}")
Hotel.create(name: "ゲストハウス睡眠の質",
	address: "青森県青森市新町2-5-6",
	latitude: "#{40.825979}",
	longitude: "#{140.742442}")
Hotel.create(name: "秘密結社NEPUTA",
	address: "青森県青森市大字浅虫字螢谷25",
	latitude: "#{40.894654}",
	longitude: "#{140.861096}")


# Hotel for 竿頭祭り id=38-47
Hotel.create(name: "ホテル秋田",
	address: "秋田県秋田市中通5-2-1",
	latitude: "#{39.713107}",
	longitude: "#{140.117878}")
Hotel.create(name: "ホテルラミレス",
	address: "秋田県秋田市中通2-6-1",
	latitude: "#{39.717295}",
	longitude: "#{140.126584}")
Hotel.create(name: "ペンション-ションペン",
	address: "秋田県秋田市添川境内川原142-3",
	latitude: "#{39.749937}",
	longitude: "#{140.131390}")
Hotel.create(name: "民宿ランボルギーニ",
	address: "秋田県秋田市太平山谷長坂66-96",
	latitude: "#{39.721399}",
	longitude: "#{140.260903}")
Hotel.create(name: "ホテル秋田美人ナイト",
	address: "秋田県秋田市添川境内川原142-1",
	latitude: "#{39.750193}",
	longitude: "#{140.132195}")
Hotel.create(name: "民宿ラマダーン月",
	address: "秋田県秋田市土崎港西1-9-1",
	latitude: "#{39.752743}",
	longitude: "#{140.060961}")
Hotel.create(name: "千秋公園",
	address: "秋田県秋田市千秋公園１",
	latitude: "#{39.723969}",
	longitude: "#{140.124133}")
Hotel.create(name: "ゲストハウス枕の匂い",
	address: "秋田県秋田市大町2-2-3",
	latitude: "#{39.718245}",
	longitude: "#{140.116939}")
Hotel.create(name: "ホテル東急東横線直通",
	address: "秋田県秋田市中通2-3-1",
	latitude: "#{39.717756}",
	longitude: "#{140.124007}")
Hotel.create(name: "Hotel ラブレボリューション",
	address: "秋田県秋田市千秋矢留町1-1",
	latitude: "#{39.720765}",
	longitude: "#{140.119265}")

# Hotel for 雪祭り id=48-57
Hotel.create(name: "ホテル札幌",
	address: "北海道札幌市中央区大通西5-3",
	latitude: "#{43.059758}",
	longitude: "#{141.350171}")
Hotel.create(name: "ホテル海馬グループ",
	address: "北海道札幌市中央区大通西8丁目2-36",
	latitude: "#{43.060329}",
	longitude: "#{141.344670}")
Hotel.create(name: "ホテルSIAM SHADE",
	address: "北海道札幌市中央区南2条西5丁目26-5",
	latitude: "#{43.057939}",
	longitude: "#{141.350782}")
Hotel.create(name: "民宿パライソパライソ",
	address: "北海道札幌市中央区南2条西5丁目26-2",
	latitude: "#{43.057850}",
	longitude: "#{141.350286}")
Hotel.create(name: "ゲストハウスHop Step Jump",
	address: "北海道札幌市中央区南3条西5-24",
	latitude: "#{43.056727}",
	longitude: "#{141.351216}")
Hotel.create(name: "ゲストハウスCasa Blanca",
	address: "北海道札幌市中央区北2条西2-23",
	latitude: "#{43.064252}",
	longitude: "#{141.353222}")
Hotel.create(name: "ホテル虫酸",
	address: "北海道札幌市中央区北2条西1丁目1-1",
	latitude: "#{43.064710}",
	longitude: "#{141.354960}")
Hotel.create(name: "ホテル Love and Soul",
	address: "北海道札幌市中央区南4条西1丁目2-1",
	latitude: "#{43.056112}",
	longitude: "#{141.357028}")
Hotel.create(name: "民宿パレスホテル",
	address: "北海道札幌市中央区南4条西2丁目2-4",
	latitude: "#{43.055704}",
	longitude: "#{141.355741}")
Hotel.create(name: "ホテル玉置&浩二",
	address: "北海道札幌市中央区南5条西7丁目",
	latitude: "#{43.053393}",
	longitude: "#{141.348801}")


# HotelPhotoを生成
54.times do |n|
	hotel_id = rand(1..27)
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
	HotelPhoto.create!(
		hotel_id: hotel_id,
		image_id: image_id.sample
		)
end

# RoomTypeを生成
81.times do |n|
	bed_type = %w[シングル ダブル キング クイーン]
	bed_count = rand(1..2).to_s
	RoomType.create!(
		hotel_id: rand(1..27),
		name: bed_type.sample + bed_count + "台",
	    charge: (rand (1..10)) *1000,
		people_count: rand(1..5)
		)
end

# 具体例Hotelに対するRoomTypeを生成
90.times do |n|
	bed_type = %w[シングル ダブル キング クイーン]
	bed_count = rand(1..2).to_s
	RoomType.create!(
		hotel_id: rand(28..57),
		name: bed_type.sample + bed_count + "台",
	    charge: (rand (1..10)) *1000,
		people_count: rand(1..5)
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
		room_type_id: rand(1..81),
		name: rand(1..9).to_s + rand(0..1).to_s + rand(1..9).to_s
	)
end

# 具体例Hotelに対するRoomを生成
180.times do |n|
	Room.create!(
		room_type_id: rand(82..171),
		name: rand(1..9).to_s + rand(0..1).to_s + rand(1..9).to_s
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


# ねぶた祭りのReservationを生成
60.times do |n|
	from = Date.parse("2019/07/31")
	to = Date.parse("2019/08/09")
	start_date = rand(from..to)
	end_date = start_date +rand(1..5)
	Reservation.create!(
		user_id: rand(1..27),
		festival_id: 28,
		room_id: rand(163..342),
        start_date: start_date,
        end_date: end_date,
		total_charge: (rand (1..10)) *1000
		)
end

# 竿頭祭りのReservationを生成
60.times do |n|
	from = Date.parse("2019/08/02")
	to = Date.parse("2019/08/08")
	start_date = rand(from..to)
	end_date = start_date +rand(1..5)
	Reservation.create!(
		user_id: rand(1..27),
		festival_id: 29,
		room_id: rand(163..342),
        start_date: start_date,
        end_date: end_date,
		total_charge: (rand (1..10)) *1000
		)
end

# さっぽろ雪祭りのReservationを生成
60.times do |n|
	from = Date.parse("2020/01/30")
	to = Date.parse("2020/02/13")
	start_date = rand(from..to)
	end_date = start_date +rand(1..5)
	Reservation.create!(
		user_id: rand(1..27),
		festival_id: 30,
		room_id: rand(163..342),
        start_date: start_date,
        end_date: end_date,
		total_charge: (rand (1..10)) *1000
		)
end
# 生成しないDB,ReservationHistory, ,Review












