class SearchController < ApplicationController
  def search
    favorite_product_ids = Favorite.where(user_id: current_user.id).map(&:product_id)
    favorite_product_ids << current_user.id
    @products = Product.where.not(id: favorite_product_ids)
    @favorites = Favorite.where(user_id: current_user)
  end

  def approve
    logger.debug "Product id #{params[:id]}"
    product_id = params[:id]
    new_favorite = Favorite.new(product_id: product_id)
    new_favorite.user_id = current_user.id
    if new_favorite.save
      existing_favorite = Favorite.where(product_id: product_id, user_id: current_user.id).count
    end
  end

  def offer
    logger.debug "Product id #{params[:id]}"
    product_id = params[:id]
    new_offer = Offer.new(product_id: product_id)
    new_offer.user_id = current_user.id
    if new_favorite.save
      existing_favorite = Offer.where(product_id: product_id, user_id: current_user.id).count
    end
  end

  def decline


  end
end
