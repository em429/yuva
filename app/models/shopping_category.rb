class ShoppingCategory < ApplicationRecord
    has_many :shopping_items

    validates :title, presence: true
end
