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

  def startoffers
    #@product = Product.where(product_id: product_id)
    id = params[:id]
    @id = params[:id]
    @user = current_user
    @product = Product.find(id)
    #@offer = Offer.new(product_id: params[:id], user_id: current_user.id)


    if @product.present?
      respond_to do |format|

        format.js { render "search/startoffers" }

      end
    end
    #@offer.user = current_user
    #@offer.product = @product
    #if @offer.save
    #  existing_offer = Offer.where(product_id: @product.id, user_id: @offer.user).count

    #  redirect_to offer_path(@chat), notice: 'Your offer has been made'
    #else
    #  render 'search'
    #end
  end

  def decline
  end
end
