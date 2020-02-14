class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @mother_category = MotherCategory.new()
  end
end
