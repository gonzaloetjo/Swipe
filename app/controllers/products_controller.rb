class Productscontroller < ApplicationController
  def index
    if params[:query].present?
      @products = Products.perform_search("#{params[:query]}")
    else
      @products = Products.all
    end
  end
end
