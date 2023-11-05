class ShoppingItem < ApplicationRecord
  belongs_to :shopping_category
  validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
