class OffersController < ApplicationController

  def index
    @offer = Offer.all
  end

  def create
    logger.debug "params:"
    logger.debug "#{@offer_params}"
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    @offer.messages.first.user_id = current_user.id
    if @offer.save!
      logger.debug "saved"
    else
      logger.debug "not saved"
    end
  end

  def update
    @offer = Offer.find(params[:id])
    logger.debug "#{offer_params}"

    respond_to do |format|
      format.js {
        if @offer.update(offer_params)
            @messages = @offer.messages
            render "offers/chat_messages"
        else

        end
      }
    end
  end


  def chat
    id = params[:id].to_i
    @user = current_user
    @products = Product.all
    @product = Product.find(params[:id])

    #offer = Offer.between(id, current_user.id)
    offer = Offer.where(product_id: id, user_id: current_user.id).count
    offer2 = Offer.where(product_id: id, user_id: current_user.id)
    #logger.debug "#{offer}"
    if offer > 0
      @offer = offer2.first
    else
      @offer = Offer.new(product_id: id, user_id: current_user.id)
      @offer.save
    end


    @message = @offer.messages.build
  end

  private


  def offer_params
    params.require(:offer).permit(:product_id, :user_id, messages_attributes: [:message_content, :user_id, :product_id])
  end
end
