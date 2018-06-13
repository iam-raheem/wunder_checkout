require_relative '../lib/cart'

RSpec.describe Cart do
  let(:prod_001) { double :Product, code: "001", price: 1.95 }
  let(:prod_002) { double :Product, code: "002", price: 5.99 }
  let(:prod_003) { double :Product, code: "003", price: 25.00 }
  let(:prod_004) { double :Product, code: "004", price: 8.41 }
  let(:prod_005) { double :Product, code: "005", price: 16.51 }
  let(:products) { [prod_001, prod_002, prod_003, prod_004, prod_005] }
  let(:product_count_adjustment) { double :ProductCountAdjustment, apply: 0 }
  let(:whole_order_adjustment) { double :WholeOrderAdjustment, apply: 0 }
  let(:each_product_adjustment) { double :EachProductAdjustment, apply: 0 }
  let(:promotions) { [product_count_adjustment, whole_order_adjustment, each_product_adjustment] }

  subject(:cost_calc) { described_class.new(promotions, products: products) }

  describe '#totals of each promotion' do
    it 'is expected to calculate cart without any promotion' do
      order = { "001" => 1, "002" => 1 }
      expect(cost_calc.total(order)).to eq 7.94
    end

    it 'is expected to be able to apply a given product_count_adjustment promotion' do
      allow(product_count_adjustment).to receive(:apply).and_return 4.0
      order = { "002" => 2, "001" => 1 }
      expect(cost_calc.total(order)).to eq 9.93
    end

    it 'is expected to be able to apply a given whole_order_adjustment promotion' do
      allow(whole_order_adjustment).to receive(:apply).and_return 3.29
      order = { "001" => 1, "002" => 1, "003" => 1 }
      expect(cost_calc.total(order)).to eq 29.65
    end

    it 'is expected to be able to apply a given each_product_adjustment promotion' do
      allow(each_product_adjustment).to receive(:apply).and_return 3.0
      order = {"001" => 3, "002" => 1, "004" => 2}
      expect(cost_calc.total(order)).to eq 25.66
    end
  end
end
