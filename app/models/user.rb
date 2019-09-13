class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  validates :email, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true

  has_many :reservations, dependent: :destroy
end
