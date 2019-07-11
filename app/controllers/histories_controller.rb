class HistoriesController < ApplicationController
  def index
  	@novel = Novel.find_by(user_id: current_user.id)
  	@history = History.find_by(user_id:current_user.id, novel_id:@novel)
  end
end
