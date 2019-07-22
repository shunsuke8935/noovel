class Novel < ApplicationRecord
	belongs_to :user
	has_many :pages
	has_many :favorites, dependent: :destroy
	has_many :histories, dependent: :destroy
	has_many :clips, dependent: :destroy

	acts_as_taggable

	def cliped_by?(user)
		clips.where(user_id: user.id).exists?
	end

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
