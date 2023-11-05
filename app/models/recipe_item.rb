class RecipeItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :shopping_item
end
