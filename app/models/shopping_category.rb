class ShoppingCategory < ApplicationRecord
    has_many :shopping_items

    validates :title, presence: true

    scope :cooking_ingredients, -> { where(id: 1) }

end
