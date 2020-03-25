class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items
  mount_uploader :image, ProductImageUploader

  validates :name, :description, :image, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 99999999.99 }
end
