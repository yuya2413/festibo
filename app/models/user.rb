class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable


  has_many :favorites, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reservation_histories

  validates :email, presence:{ message: "メールアドレスを入力してください" }
  validates :last_name, presence:{ message: "苗字を入力してください" }
  validates :first_name, presence:{ message: "名前を入力してください" }
  enum status:{利用中: 0, 退会済み: 1, 強制退会:2}

  def self.search(search)
    return User.all unless search
    User.where([' last_name || first_name LIKE ? ', "%#{search}%"])
  end
end
