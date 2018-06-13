class Cart
  def initialize(promotional_rules, products: nil)
    @promotional_rules = promotional_rules
    @product_prices = products_with_prices(products)
  end

  def total(order)
    apply_promotions(sum_without_promotions(order), order)
  end

  private

  attr_reader :product_prices, :promotional_rules

  def sum_without_promotions(order)
    order.reduce(0) do |sum, (item, num)|
      sum += cost_for(item, num)
    end
  end

  def apply_promotions(cost_before_promotions, order)
    promotional_rules.reduce(cost_before_promotions) do |current_total, rule|
      current_total - rule.apply(current_total, order, product_prices)
    end
  end

  def cost_for(item, num)
    product_prices[item] * num
  end

  def products_with_prices(products)
    products.map { |product| [product.code, product.price] }
      .to_h
  end
end
