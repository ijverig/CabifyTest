require './checkout'

# test case 1
co = Checkout.new
["VOUCHER", "TSHIRT", "MUG"].each do |item|
    co.scan item
end
co.total
puts "(Should be 32.50)"
puts

# test case 2
co = Checkout.new
["VOUCHER", "TSHIRT", "VOUCHER"].each do |item|
    co.scan item
end
co.total
puts "(Should be 25.00)"
puts

# test case 3
co = Checkout.new
["TSHIRT", "TSHIRT", "TSHIRT", "VOUCHER", "TSHIRT"].each do |item|
    co.scan item
end
co.total
puts "(Should be 81.00)"
puts

# test case 4
co = Checkout.new
["VOUCHER", "TSHIRT", "VOUCHER", "VOUCHER", "MUG", "TSHIRT", "TSHIRT"].each do |item|
    co.scan item
end
co.total
puts "(Should be 74.50)"
puts
