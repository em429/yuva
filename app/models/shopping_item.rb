class ShoppingItem < ApplicationRecord
  belongs_to :shopping_category
  has_many :recipe_items, dependent: :destroy
  has_many :recipes, through: :recipe_items

  validates :stock, inclusion: [true, false]
  validates :title, presence: true
  validates_uniqueness_of :title

  scope :cooking_ingredients, -> { where(shopping_category_id: 1) }

end
