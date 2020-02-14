class FavoritesController < ApplicationController
  def favorites
    @currentuser = current_user.id
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def images
    @images = Product.images_p
  end



  #def show
  #  @favorite = Favorite.find(params[:id])
  #  @product = @favorite.product
  #  authorize @product
  #end


#def edit
#  @favorite = Favorite.find(params[:id])
#end

#def destroy
#  @favorite = Favorite.find(params[:id])
#  @favorite.destroy
#  redirect_to favorites_path
#end

 # private

#  def favorite_params
#    params.require(:favorite).permit(:start_date, :end_date)
#  end
end
