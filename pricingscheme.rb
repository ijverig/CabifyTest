'''
pricing rules syntax:


for 1 or more products:
    1 => price1

for 3 or more products:
    3 => price2


For example:

Code         | Name                |  Price  |  Price for 2 |  Price for 3
-----------------------------------------------------------------------------
VOUCHER      | Cabify Voucher      |   5.00€ |      5.00€   |      5.00€
TSHIRT       | Cabify T-Shirt      |  20.00€ |     20.00€   |     19.00€
MUG          | Cafify Coffee Mug   |   7.50€ |      7.50€   |      7.50€

is translated to:

prices = {
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
}

'''

class PricingScheme
    def initialize(prices)
        @prices = prices
    end

    def price_for(item, quantity)
        price = discount_price(item, quantity)

        case item
        when "VOUCHER"
            price * rule2for1(quantity)
        when "TSHIRT"
            price * quantity
        when "MUG"
            price * quantity
        end
    end

    def discount_price(item, quantity)
        prices = @prices[item].sort.reverse

        prices.each do |discount_qt, discount_price|
            return discount_price if quantity >= discount_qt
        end
    end

    def rule2for1(quantity)
        ruleXforY(2, 1, quantity)
    end

    def ruleXforY(x, y, quantity)
        # groups of X + remainders
        ((quantity / x) * y) + (quantity % x)
    end
end
