class PricingScheme
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
        # pairs + remainders
        (quantity / 2) + (quantity % 2)
    end
end
