class OffersController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @offer = Offer.new
    @offer.start_date = params[:offer][:start_date].split('to') [0]
    if params[:offer][:start_date].split(' to ') [1].nil?
    @offer.end_date = params[:offer][:start_date].split('to') [0]
    else
    @offer.end_date = params[:offer][:start_date].split(' to ') [1]
    end

    @offer.user = current_user
    @offer.product = @product

    if @offer.save
      redirect_to offer_path(@offer), notice: 'Your offer has been made'
    else
      render 'products/show'
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @product = @offer.product
    authorize @product
  end

def index
  @offers = policy_scope(offer).all
  @myoffers = current_user.offers
end

def edit
  @offer = Offer.find(params[:id])
end

def destroy
  @offer = Offer.find(params[:id])
  @offer.destroy
  redirect_to offers_path
end

  private

  def offer_params
    params.require(:offer).permit(:start_date, :end_date)
  end
end
