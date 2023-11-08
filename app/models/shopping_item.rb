class ShoppingItem < ApplicationRecord
  belongs_to :shopping_category
  has_many :recipe_items, dependent: :destroy
  has_many :recipes, through: :recipe_items

  validates :stock, numericality: { greater_than_or_equal_to: 0 }
  validates :title, presence: true
  validates :unit, presence: true
  validates :importance, presence: true

  scope :cooking_ingredients, -> { where(shopping_category_id: 1) }

  # If unit is db (piece), increment and decrement by 1. Otherwise by 0.5
  def increment_stock
    case self.unit
      when 'db'
        self.stock += 1
      else
        self.stock += 0.5
    end
  end

  def decrement_stock
    case self.unit
      when 'db'
        self.stock -= 1
      else
        self.stock -= 0.5
    end
  end

end
