class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  #def favorites
  #  @favorites = Favorite.where(user_id: current_user.id)
  #end
end
