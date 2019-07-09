class PagesController < ApplicationController
  def new
  	@page = Page.new
  end

  def create
  	@page = Page.new(page_params)
  	@novel = Novel.find(params[:novel_id])
  	@page.novel_id = @novel.id
  	@page.save
  	redirect_to new_novel_page_path(@novel.id)
  end

  def index
    @novel = Novel.find(params[:novel_id])
    @pages = @novel.pages
  end

  def show
    @page = Page.find(params[:id])
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
