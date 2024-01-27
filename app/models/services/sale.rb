module Services
  class Sale
    attr_accessor :user

    def initialize(user, products)
      @user = user
      @products = products
      
      
    end

    def perform
      @sale = create_sale
      if @sale 
        if create_sale_items
          update_sale
        end
      end
    end

    private 

    def create_sale 
      @user.sales.create(sale_date: DateTime.now)
    end

    def create_sale_items
      @products.each do |product_id, quantity|
        @sale.sale_items.create(product: Product.find(product_id), quantity: quantity, subtotal: Product.find(product_id).price * quantity)
      end
    end

    def update_sale 
      @sale.update(total: @sale.sale_items.sum(:subtotal).to_i)
    end

  end

    
end