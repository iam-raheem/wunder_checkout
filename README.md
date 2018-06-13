# Wunder Checkout System
This is a basic checkout ruby system which calculates the cost of cart based on different promotions applied on the products or cart.

## Installation Instructions

Install Ruby 2.4.x or Higher Version

Clone the repository & Setup:

```ruby
$ git clone https://github.com/srinu0541/wunder_checkout.git
$ cd wunder_checkout
$ bundle install
```

## Task

Sample Products

```ruby
Product code  | Name               | Price
---------------------------------------------
001           | Curry Sauce        | 1.95 €
002           | Pizza              | 5.99 €
003           | Men T-shirt        | 25.00 €
004           | Dettol Soap        | 8.41 €
005           | Trekking Backpack  | 16.51 €
```

## Usage

```ruby
$ run checkout
```
Output of the above task:

```ruby
Use Case #1:
Cart: 001,002,003
Total with promotions => 29.65 €
*******************************
Use Case #2:
Cart: 002,001,002
Total with promotions => 9.93 €
*******************************
Use Case #3:
Cart: 002,001,002,003
Total with promotions => 31.44 €
*******************************
Use Case #4:
Cart: 001,002,003,004,002,005
Total with promotions => 51.16 €
*******************************
```

## To modify the configurations for different use cases of different products

```ruby
$ sudo vim Rakefile
```

To add new products, just append your new product details to the below input list items as an array

```ruby
input_list_items = [
  ['001', 'Curry Sauce', 1.95],
  ['002', 'Pizza', 5.99],
  ['003', 'Men T-Shirt', 25.00],
  ['004', 'Dettol Soap', 8.41],
  ['005', 'Trekking Backpack', 16.51]
]
```

To add new use case, just append your new use case details to the below use cases as an array

```ruby
use_cases = [
  ['001', '002', '003'],
  ['002', '001', '002'],
  ['002', '001', '002', '003'],
  ['001', '002', '003', '004', '002', '005']
]
```