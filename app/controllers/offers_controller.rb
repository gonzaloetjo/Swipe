class OffersController < ApplicationController

  def index
    @offer = Offer.all
  end

  def new
  end

  def create
    @product = Product.find(params[:id])
    @offer = Offer.new
    @offer.user = current_user
    @offer.product = @product

    #if @offer.save
    #  redirect_to offer_path(@chat), notice: 'Your offer has been made'
    #else
    #  render 'search'
    #end
  end

  def show
    @offer = Offer.find(params[:id])
    @product = @offer.new
  end
end
