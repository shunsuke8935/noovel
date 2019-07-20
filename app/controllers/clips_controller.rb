class ClipsController < ApplicationController
  def index
    @clips = Clip.where(user_id: current_user.id)

  end

  def create
  	@user = current_user
  	@novel = Novel.find(params[:novel_id])
  	@clip = Clip.new(user_id: @user.id, novel_id: @novel.id)

  	@clip.save
  	redirect_to user_clips_path(current_user.id)
  end

  def destroy
  	@clip = Clip.find(params[:id])
  	@clip.destroy
  	redirect_to user_clips_path(current_user.id)
  end
end
