# Product Model
require_relative 'lib/product'

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

puts products.inspect
puts products.length

