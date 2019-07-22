class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :novels, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :histories, dependent: :destroy
         has_many :clips, dependent: :destroy

end
