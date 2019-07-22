class History < ApplicationRecord
	belongs_to :user
	belongs_to :novel
	belongs_to :page
end
