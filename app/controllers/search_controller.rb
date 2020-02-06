class SearchController < ApplicationController

  def search
    @products = Product.where.not(id: current_user.id)
  end

  def approve
  end

  def decline
  end
end
