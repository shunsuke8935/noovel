class Novel < ApplicationRecord
	belongs_to :user
	has_many :pages
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
