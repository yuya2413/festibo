class Festival < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :prefecture, optional: true

  has_many :festivals_categories
  has_many :categories, through: :festivals_categories
  accepts_nested_attributes_for :festivals_categories, allow_destroy: true

  has_many :festival_photos, dependent: :destroy
  accepts_attachments_for :festival_photos, attachment: :images
  accepts_nested_attributes_for :festival_photos, allow_destroy: true

  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reservation_histories

  validates :name, presence:{ message: "祭り名を入力してください" }
  validates :address, presence:{ message: "祭り開催地を入力してください" }
  validates :start_date, presence:{ message: "祭り開始日を入力してください" }
  validates :end_date, presence:{ message: "祭り終了日を入力してください" }
  validate :start_end_check

  enum value_1:{とても大きい: 0, 大きい: 1, 普通: 2, 小さい: 3, とても小さい: 4}
  enum value_2:{歴史がある: 0, 約30年: 1, 約20年: 2, 約10年: 3, 最近: 4}
  enum value_3:{県外からもたくさん: 0, 県外からも: 1, どっちも: 2, やや地元中心: 3, 地元中心: 4}
  enum value_4:{王道: 0, オーソドックス: 1, 中間: 2, ちょっと奇妙: 3, 奇祭: 4}
  enum value_5:{子供向け: 0, 子供も楽しめる: 1, 大人も子供も: 2, やや大人向け: 3, 大人だけ: 4}

  #日付検索を呼び出そうとしたけどやり方が全くわからないので保留
  #def self.date_search(date_search)
  #  if params[:start_date].present?
  #    start_date = Date.parse(params[:start_date])
  #    from = start_date - 7
  #    to = start_date + 8
  #    date_search = where(start_date: from...to)
  #end

  def start_end_check
    errors.add(:end_date, "の日付を正しく入力してください") unless
    self.start_date < self.end_date
  end

  def self.search(search)
    return Festival.all unless search
    Festival.where([' name LIKE ? ', "%#{search}%"])
  end
end
