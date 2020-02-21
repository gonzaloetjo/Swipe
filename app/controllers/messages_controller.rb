#class MessagesController < ApplicationController
#  def index
#    if params[:query].present?
#      @messaages = Messaages.perform_search("#{params[:query]}")
#    else
#      @messaages = Messaages.all
#    end
#  end
#end
