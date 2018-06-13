require_relative '../lib/product'

RSpec.describe Product do
  subject(:product) { described_class.new(code: '001', name: 'Curry Sauce', price: 1.95) }

  describe '#code' do
    it 'is expected to return the code for the product' do
      expect(product.code).to eq '001'
    end
  end

  describe '#name' do
    it 'is expected to return the code for the product' do
      expect(product.name).to eq 'Curry Sauce'
    end
  end

  describe '#price' do
    it 'is expected to return the price of the product' do
      expect(product.price).to eq 1.95
    end
  end
end
