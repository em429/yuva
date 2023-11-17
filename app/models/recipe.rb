class Recipe < ApplicationRecord
    has_many :recipe_items, dependent: :destroy
    has_many :shopping_items, through: :recipe_items

    validates :title, presence: true
    validates_uniqueness_of :title
    validates :description, presence: true
end
