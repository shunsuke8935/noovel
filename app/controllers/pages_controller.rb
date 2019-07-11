class PagesController < ApplicationController
  def new
    @header = Novel.find(params[:novel_id])
  	@page = Page.new
  end

  def create
  	@page = Page.new(page_params)
  	@novel = Novel.find(params[:novel_id])
  	@page.novel_id = @novel.id
  	@page.save
  	redirect_to novel_path(@novel.id)
  end

  def index
    @novel = Novel.find(params[:novel_id])
    @pages = @novel.pages
    @favorite = Favorite.find_by(user_id:current_user.id, novel_id: @novel)

  end

  def show
    @page = Page.find(params[:id])
    @novel = Novel.find(@page.novel_id)
    new_history = @novel.history.new
    new_history.user_id = current_user.id

    if current_user.history.exists?(novel_id: "#{params[:novel_id]}")
      old_history = current_user.history.find_by(novel_id: "#{params[:novel_id]}")
      old_history.destroy
    end

    new_history.save

    histories_stock_limit = 10
    histories = current_user.history.all
    if histories.count > histories_stock_limit
      histories[0].destroy
    end

    @novel.pages.count
    if Page.where("id < #{@page.id} and novel_id = #{@page.novel.id}").exists? 
      @mae = Page.where("id < #{@page.id} and novel_id = #{@page.novel.id}").max
    end
    if Page.where("id > #{@page.id} and novel_id = #{@page.novel.id}").exists?
      @ato = Page.where("id > #{@page.id} and novel_id = #{@page.novel.id}").min
    end
    @novel = Novel.find(@page.novel_id)
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @novel = Novel.find(params[:novel_id])
    @page.update(page_params)
    redirect_to novel_page_path(@novel, @page)
  end

  private
  def page_params
  	params.require(:page).permit(:title, :text, :novel_id)
  end
end
