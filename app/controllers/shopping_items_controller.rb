class ShoppingItemsController < ApplicationController
  before_action :set_shopping_item, only: %i[ show edit update destroy ]

  def toggle_stock
    @item = ShoppingItem.find(params[:id])

    @item.stock = !@item.stock
    if @item.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("shopping-item-#{@item.id}",
                partial: "home/shopping_item",
                status: :ok,
                locals: { item: @item })
        end
        format.html { redirect_to home_path }
      end
    end
  end

  def search
    @shopping_items = ShoppingItem.cooking_ingredients.where("title LIKE ?", "%#{params[:q]}%")

    respond_to do |format|
      format.json
      #format.html
    end
  end

  # GET /shopping_items/1
  def show
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
                                partial: "home/inline_shopping_form",
                                locals: { item: ShoppingItem.new,
                                          category: category,
                                          hide_form: false }),
            turbo_stream.prepend("shopping-items-#{category.id}",
                                partial: "home/shopping_item",
                                locals: { item: @shopping_item })
          ]

        end
        format.html do
          redirect_to @shopping_item, notice: "Shopping item was successfully created."
        end
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("form-#{category.id}",
                                                    partial: "home/inline_shopping_form",
                                                    locals: { item: @shopping_item,
                                                              category: category,
                                                              hide_form: false })
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
    #redirect_to root_url, notice: "Shopping item was successfully destroyed.", status: :see_other
    redirect_to root_url, status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_item
      @shopping_item = ShoppingItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_item_params
      params.require(:shopping_item).permit(:title, :stock, :shopping_category_id, :notes, :unit)
    end
end
