class FavoritesController < ApplicationController
  def index
  	@all_ranks = Novel.find(Favorite.group(:novel_id).order('count(novel_id) desc').pluck(:novel_id))
  end

  def create
  	@novel = Novel.find(params[:novel_id])
  	favorite = current_user.favorites.new(novel_id: @novel.id)
  	favorite.save
  end

  def destroy
  	@novel = Novel.find(params[:novel_id])
    @favorite = Favorite.find_by(user_id:current_user.id, novel_id: @novel.id)

  	@favorite.destroy
  end
  private
  def favorite_params
  	params.require(:favorite).permit(:id, :novel_id, :user_id)
  end
end
