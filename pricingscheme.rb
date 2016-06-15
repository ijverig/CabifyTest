'''
pricing rules syntax:


for 1 or more products:
    1 => price1

for 3 or more products:
    3 => price2


For example, for the following pricing scheme:

Code         | Name                |  Price  |  Price for 2 |  Price for 3
-----------------------------------------------------------------------------
VOUCHER      | Cabify Voucher      |   5.00€ |      5.00€   |      5.00€
TSHIRT       | Cabify T-Shirt      |  20.00€ |     20.00€   |     19.00€
MUG          | Cafify Coffee Mug   |   7.50€ |      7.50€   |      7.50€

and quantity scheme:

- 2-for-1 special on VOUCHER items

the appropriate rules is:

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

'''

class PricingScheme
    def initialize(rules)
        @prices = rules[:pricing]
        @quantity = rules[:quantity]
    end

    def price_for(item, quantity)
        price = discount_price(item, quantity)
        discount_qt = discount_quantity(item, quantity)

        return price * discount_qt
    end

    def discount_price(item, quantity)
        prices = @prices[item].sort.reverse

        prices.each do |discount_qt, discount_price|
            return discount_price if quantity >= discount_qt
        end
    end

    def discount_quantity(item, quantity)
        if @quantity[item]
            x = @quantity[item][0]
            y = @quantity[item][1]

            return ruleXforY(x, y, quantity)
        else
            return quantity
        end
    end

    def ruleXforY(x, y, quantity)
        # groups of X + remainders
        ((quantity / x) * y) + (quantity % x)
    end
end
