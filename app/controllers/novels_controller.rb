class NovelsController < ApplicationController
  def new
  	@novel = Novel.new
  end

  def create
  	@novel = Novel.new(novel_params)
  	@novel.user_id = current_user.id
  	@novel.save
  	redirect_to new_novel_page_path(@novel.id)
  end

  def index
    @novel = Novel.all
  end

  def show
  	@novel = Novel.find(params[:id])
  end

  def edit
    @novel = Novel.find(params[:id])
    @pages = @novel.pages
  end

  def update
    @novel = Novel.find(params[:id])
    @novel.update(novel_params)
    redirect_to novel_path(@novel.id)
  end

  private

  def novel_params
  	params.require(:novel).permit(:synopsis, :genre, :title, :user_id)
  end
end
