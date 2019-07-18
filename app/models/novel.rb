class Novel < ApplicationRecord
	belongs_to :user
	has_many :pages
	has_many :favorites, dependent: :destroy
	has_many :history, dependent: :destroy
	has_many :clips

	def cliped_by?(user)
		clips.where(user_id: user.id).exists?
	end

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
