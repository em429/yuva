class Recipe < ApplicationRecord
    has_many :recipe_items
    has_many :shopping_items, through: :recipe_items
end
