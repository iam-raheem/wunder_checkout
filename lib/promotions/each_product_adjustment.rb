class EachProductAdjustment
  def initialize(min_products:, promotion_price:)
    @min_products = min_products
    @promotion_price = promotion_price
  end

  def apply(current_total, order, product_prices)
    order_count = order.sum {|k,v| v}
    can_promotion_provide?(order, order_count) ? apply_promotion_on_order?(order, order_count) : 0
  end

  private

  attr_reader :product_code, :min_products, :promotion_price

  def can_promotion_provide?(order, order_count)
    order_count > min_products
  end

  def apply_promotion_on_order?(order, order_count)
    order_count * promotion_price
  end
end