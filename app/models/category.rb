class Category < ApplicationRecord
	has_many :festivals_categories
	has_many :festivals, through: :festivals_categories
	validates :name,
	    presence:{ message: "カテゴリーを指定してください" },
	    uniqueness:{case_sensitive: false}
end
