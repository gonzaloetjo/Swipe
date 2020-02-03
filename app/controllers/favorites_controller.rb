class FavoritesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @favorite = Favorite.new
    @favorite.start_date = params[:favorite][:start_date].split('to') [0]
    if params[:favorite][:start_date].split(' to ') [1].nil?
    @favorite.end_date = params[:favorite][:start_date].split('to') [0]
    else
    @favorite.end_date = params[:favorite][:start_date].split(' to ') [1]
    end

    @favorite.user = current_user
    @favorite.product = @product

    if @favorite.save
      redirect_to favorite_path(@favorite), notice: 'Your favorite has been made'
    else
      render 'products/show'
    end
  end

  def show
    @favorite = Favorite.find(params[:id])
    @product = @favorite.product
    authorize @product
  end

def index
  @favorites = policy_scope(favorite).all
  @myfavorites = current_user.favorites
end

def edit
  @favorite = Favorite.find(params[:id])
end

def destroy
  @favorite = Favorite.find(params[:id])
  @favorite.destroy
  redirect_to favorites_path
end

  private

  def favorite_params
    params.require(:favorite).permit(:start_date, :end_date)
  end
end
