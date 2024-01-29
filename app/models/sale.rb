class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_items

  validates :sale_date, presence: true 
  validates :user_id, presence: true 
  
  def sale_time 
    self.sale_date.strftime("%H:%M:%S")
  end
end
