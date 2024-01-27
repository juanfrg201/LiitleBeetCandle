class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_items

  validates :sale_date, presence: true 
  validates :user_id, presence: true 
  

end
