'''
co = Checkout.new(pricing_rules)
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("TSHIRT")
price = co.total


Items: VOUCHER, TSHIRT, MUG
Total: 32.50€

Items: VOUCHER, TSHIRT, VOUCHER
Total: 25.00€

Items: TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT
Total: 81.00€

Items: VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT
Total: 74.50€
'''

class Checkout
    def scan(item)
        puts item
    end

    def total
        puts "Total: 76.40"
    end
end

co = Checkout.new
co.scan "VOUCHER"
co.scan "TSHIRT"
co.scan "MUG"
co.scan "TSHIRT"
co.total
