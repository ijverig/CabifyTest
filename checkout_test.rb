require './checkout'
require './pricingscheme'

# test set setup
# this syntax is explained in pricingsceme.rb
rules = {
    :pricing => {
        "VOUCHER"   => {
            1   => 5.00
        },

        "TSHIRT"    => {
            1   => 20.00,
            3   => 19.00
        },

        "MUG"       => {
            1   => 7.50
        }
    },

    :quantity => {
        "VOUCHER"   => [2,1]
    }
}
pricing_rules = PricingScheme.new(rules)

# test case 1
co = Checkout.new(pricing_rules)
["VOUCHER", "TSHIRT", "MUG"].each do |item|
    co.scan item
end
co.total
puts "(Should be 32.50)"
puts

# test case 2
co = Checkout.new(pricing_rules)
["VOUCHER", "TSHIRT", "VOUCHER"].each do |item|
    co.scan item
end
co.total
puts "(Should be 25.00)"
puts

# test case 3
co = Checkout.new(pricing_rules)
["TSHIRT", "TSHIRT", "TSHIRT", "VOUCHER", "TSHIRT"].each do |item|
    co.scan item
end
co.total
puts "(Should be 81.00)"
puts

# test case 4
co = Checkout.new(pricing_rules)
["VOUCHER", "TSHIRT", "VOUCHER", "VOUCHER", "MUG", "TSHIRT", "TSHIRT"].each do |item|
    co.scan item
end
co.total
puts "(Should be 74.50)"
puts
