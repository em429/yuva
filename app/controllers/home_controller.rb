class HomeController < ApplicationController
  def index
    @shopping_categories = ShoppingCategory.includes(:shopping_items)
  end
end
