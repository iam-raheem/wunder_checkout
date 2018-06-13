require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "To execute your checkout system"
task :checkout do
  project_root = File.dirname(File.absolute_path(__FILE__))
  Dir.glob(project_root + '/lib/**/*.{rb}') { |file| require_relative file }

  # You can append n no.of products
  input_list_items = [
    ['001', 'Curry Sauce', 1.95],
    ['002', 'Pizza', 5.99],
    ['003', 'Men T-Shirt', 25.00],
    ['004', 'Dettol Soap', 8.41],
    ['005', 'Trekking Backpack', 16.51]
  ]

  # Products array which holds the list of individual product objects
  products = []

  # Creating product objects from the input list items
  input_list_items.each do |item|
    prod_obj = Product.new(code: item[0], name: item[1], price: item[2])
    products.push(prod_obj)
  end

  # If you buy 2 or more pizza’s then the price drops to €3.99.
  prom_rule_1 = ProductCountAdjustment.new(product_code: "002", min_products: 2, promotion_price: 3.99)

  # If you buy more than 5 products then the price of each product will less by €0.5
  prom_rule_2 = EachProductAdjustment.new(min_products: 5, promotion_price: 0.5)

  # If you spend over €30, then you get 10% off your purchase.
  prom_rule_3 = WholeOrderAdjustment.new(percent: 10, cross_limit: 30)

  promotion_rules = [prom_rule_1, prom_rule_2, prom_rule_3]

  # You can add n.of use cases
  use_cases = [
    ['001', '002', '003'],
    ['002', '001', '002'],
    ['002', '001', '002', '003'],
    ['001', '002', '003', '004', '002', '005']
  ]

  use_cases.each.with_index(1) do |uc, uc_i|
    checkout = WunderCheckout.new(promotion_rules, products: products)
    
    puts "Use Case ##{uc_i}:"
    puts "Cart: #{uc.join(',')}"
    
    uc.each do |v|
      checkout.scan(v)
    end

    price = checkout.total_with_promotions
    puts "Total with promotions => " + price + " €"
    puts "*******************************"
  end
end
