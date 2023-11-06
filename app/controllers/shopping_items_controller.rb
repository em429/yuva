class ShoppingItemsController < ApplicationController
  before_action :set_shopping_item, only: %i[ show edit update destroy ]

  def increment
    @item = ShoppingItem.find(params[:id])
    @item.increment_stock
    redirect_to dashboard_path
  end

  def decrement
    @item = ShoppingItem.find(params[:id])

    @item.decrement_stock
    if @item.save
      redirect_to dashboard_path
    else
      redirect_to dashboard_path, notice: "Stock is already at 0, can't be decremented further."
    end
  end

  def search
    @shopping_items = ShoppingItem.where("title LIKE ?", "%#{params[:q]}%")

    respond_to do |format|
      format.json
      #format.html
    end
  end

  # GET /shopping_items
  def index
    @shopping_items = ShoppingItem.all
  end

  # GET /shopping_items/1
  def show
  end

  # GET /shopping_items/new
  def new
    @shopping_item = ShoppingItem.new
  end

  # GET /shopping_items/1/edit
  def edit
  end

  # POST /shopping_items
  def create
    @shopping_item = ShoppingItem.new(shopping_item_params)
    category = ShoppingCategory.find(@shopping_item.shopping_category_id)


    respond_to do |format|
      if @shopping_item.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("form-#{category.id}",
                                partial: "dashboard/inline_shopping_form",
                                locals: { item: ShoppingItem.new,
                                          category: category,
                                          hide_form: false }),
            turbo_stream.replace("shopping-items-#{category.id}",
                                partial: "dashboard/shopping_items_list",
                                locals: { category: category })
          ]

        end
        format.html do
          redirect_to @shopping_item, notice: "Shopping item was successfully created."
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("form-#{category.id}",
                                                    partial: "dashboard/inline_shopping_form",
                                                    locals: { shopping_item: @shopping_item })
        end
        format.html do
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /shopping_items/1
  def update
    if @shopping_item.update(shopping_item_params)
      redirect_to @shopping_item, notice: "Shopping item was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /shopping_items/1
  def destroy
    @shopping_item.destroy!
    redirect_to shopping_items_url, notice: "Shopping item was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_item
      @shopping_item = ShoppingItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_item_params
      params.require(:shopping_item).permit(:title, :stock, :shopping_category_id, :notes, :importance, :unit)
    end
end
