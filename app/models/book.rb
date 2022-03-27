class Book < ApplicationRecord
	attachment :image

	validates :title, presence: true
	validates :body, presence: true
	validates :image, presence: false
end
