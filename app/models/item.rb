class Item < ApplicationRecord
  belongs_to :category

  validates_presence_of :name, :price, :category

  scope :by_categories, -> (category_ids) { where(category_id: category_ids) }
end
