class ProductCountAdjustment
  def initialize(product_code:, min_products:, promotion_price:)
    @product_code = product_code
    @min_products = min_products
    @promotion_price = promotion_price
  end

  def apply(current_total, order, product_prices)
    can_promotion_provide?(order) ? apply_promotion_on_product(current_total, order, product_prices) : 0
  end

  private

  attr_reader :product_code, :min_products, :promotion_price

  def can_promotion_provide?(order)
    order[product_code] >= min_products
  end

  def apply_promotion_on_product(current_total, order, product_prices)
    (order[product_code] * product_prices[product_code]) - (order[product_code] * promotion_price)    
  end
end