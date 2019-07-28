class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@novels = @user.novels
  	@favorites = Favorite.where(novel_id: @novels)
  end

  def edit
  end
end
