require_relative "wunder_checkout/version"

require_relative 'cart'

class WunderCheckout
  def initialize(promotions = nil, products: nil, cart: Cart)
    @products = products
    @cart = cart.new(promotions, products: products)
    @order = Hash.new(0)
  end

  def scan(prdouct_code)
    @order[prdouct_code] += 1 if product_available?(prdouct_code)    
  end

  def total_with_promotions
    '£%.2f' % @cart.total(@order)
  end

  private

  attr_reader :products, :cart, :order

  def product_available?(prdouct_code)
    @products.map{ |product| product.code }.include?(prdouct_code)
  end
end
