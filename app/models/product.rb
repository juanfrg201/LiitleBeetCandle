class Product < ApplicationRecord
  has_many :sale_items

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  
end
