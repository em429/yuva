class ShoppingCategoriesController < ApplicationController
  before_action :set_shopping_category, only: %i[ show edit update destroy ]

  # GET /shopping_categories
  def index
    @shopping_categories = ShoppingCategory.all
  end

  # GET /shopping_categories/1
  def show
  end

  # GET /shopping_categories/new
  def new
    @shopping_category = ShoppingCategory.new
  end

  # GET /shopping_categories/1/edit
  def edit
  end

  # POST /shopping_categories
  def create
    @shopping_category = ShoppingCategory.new(shopping_category_params)

    if @shopping_category.save
      redirect_to @shopping_category, notice: "Shopping category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shopping_categories/1
  def update
    if @shopping_category.update(shopping_category_params)
      redirect_to @shopping_category, notice: "Shopping category was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /shopping_categories/1
  def destroy
    @shopping_category.destroy!
    redirect_to shopping_categories_url, notice: "Shopping category was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_category
      @shopping_category = ShoppingCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_category_params
      params.require(:shopping_category).permit(:title, :color, :notes, :importance)
    end
end
