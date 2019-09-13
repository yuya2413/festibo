class Category < ApplicationRecord
	has_many :festivals
	validates :name, presence:{ message: "カテゴリーを指定してください" },
	    uniqueness: { case_sensitive: false, message: "このカテゴリーは登録済みです" }
end
