class HistoriesController < ApplicationController
  def index
  	@history = History.where(user_id: current_user.id)
  end
end
