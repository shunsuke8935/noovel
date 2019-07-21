class Page < ApplicationRecord
	belongs_to :novel
	has_many :histories, dependent: :destroy

	def previous
		novel.pages.order('published_at desc, id desc').where('published_at <= ? and id < ?', published_at, id).first
	end

	def next
		novel.pages.order('published_at desc, id desc').where('published_at >= ? and id > ?', published_at, id).reverse.first
	end
end

