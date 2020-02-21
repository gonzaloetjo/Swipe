class OffersController < ApplicationController

  def index
    @offer = Offer.all
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    @offer.messages.user_id = current_user.id

    if @offer.save
      offer[:user_id] = current_user.id
      flash[:success] = "New User created."
      redirect_to '/offer/chat' + product_id
      logger.debug "saved"

    else
      logger.debug "not saved"
    end
  end

  def chat
    @user = current_user
    @products = Product.all
    @product = Product.find(params[:id])
    @offer = Offer.new(product_id: params[:id], user_id: current_user.id)
    @offer.save
    @message = @offer.messages.build
    logger.debug(params[:id])
    if @offer.save
    logger.debug "saved"

    #redirect_to offer_path(@chat), notice: 'Your offer has been made'
    logger.debug "path finished"
    else
      logger.debug "not saved"

    #else
    #  render 'search'
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @product = @offer.new
  end

  private


  def offer_params
    params.permit(:pruduct_id, messages_attributes: [:message_content, :user_id, :product_id])
  end
end
