class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_items
end
