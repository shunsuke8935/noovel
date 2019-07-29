class NovelsController < ApplicationController
  def new
  	@novel = Novel.new
  end

  def create
  	@novel = Novel.new(novel_params)
  	@novel.user_id = current_user.id

    if @novel.save
      redirect_to new_novel_page_path(@novel.id)
    else
  	  redirect_to new_novel_path
    end

  end

  def index
    @novel = Novel.all
    @all_ranks = Novel.find(Favorite.group(:novel_id).order('count(novel_id) desc').pluck(:novel_id))
    @ranks = Novel.find(Favorite.group(:novel_id).order('count(novel_id) desc').limit(5).pluck(:novel_id))
    @genre_ranks = @all_ranks.select{ |genre| genre.genre == "ファンタジー" }
    @genre2_ranks = @all_ranks.select{ |genre| genre.genre == "恋愛" }
    @genre3_ranks = @all_ranks.select{ |genre| genre.genre == "ミステリー" }
    @genre4_ranks = @all_ranks.select{ |genre| genre.genre == "ホラー" }
  end

  def show
  	@novel = Novel.find(params[:id])
    if  user_signed_in?
      @favorite = Favorite.find_by(user_id:current_user.id, novel_id: @novel.id)
      @clip = Clip.find_by(user_id: current_user.id, novel_id: @novel)
      @history = History.find_by(user_id: current_user.id, novel_id: @novel)
    end
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
  	params.require(:novel).permit(:synopsis, :genre, :title, :user_id, :tag_list)
  end
end
