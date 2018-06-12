require "wunder_checkout/version"

class WunderCheckout
  def initialize(promotions = nil, products: nil, cart: Cart)
    @products = products
    @basket = cart.new(promotions, products: products)
    @order = Hash.new(0)
  end

  def scan(prdouct_code)
    fail "#{prdouct_code} is not a valid item code" unless item_in_products?(prdouct_code)
    @order[prdouct_code] += 1
  end
end
