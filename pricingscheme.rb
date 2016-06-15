class PricingScheme
    def initialize(prices)
        @prices = prices
    end

    def price_for(item, quantity)
        case item
        when "VOUCHER"
            5.00 * rule2for1(quantity)
        when "TSHIRT"
            (quantity >= 3 ? 19.00 : 20.00) * quantity
        when "MUG"
            7.50 * quantity
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
