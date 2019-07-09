class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@novels = @user.novels
  end

  def edit
  end
end
