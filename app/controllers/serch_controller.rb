class SerchController < ApplicationController
  def index
  end

  def tag
  	if params[:tag]
      @novel = Novel.tagged_with(params[:tag])
    else
      @novel = Novel.all
    end
  end
end
