class WholeOrderAdjustment
  def initialize(percent:, cross_limit:)
    @percent = percent
    @cross_limit = cross_limit
  end

  def apply(current_total, order, product_prices)
    can_promotion_provide?(current_total) ? apply_promotion_on_total(current_total) : 0
  end

  private

  attr_reader :percent, :cross_limit

  def can_promotion_provide?(current_total)
    current_total > cross_limit
  end

  def apply_promotion_on_total(current_total)
    current_total * percent / 100
  end
end
