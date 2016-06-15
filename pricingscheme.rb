class PricingScheme
    def price_for(item, quantity)
        case item
        when "VOUCHER"
            5 * (quantity / 2.0).ceil
        when "TSHIRT"
            (quantity >= 3 ? 19 : 20) * quantity
        when "MUG"
            7.50 * quantity
        end
    end
end
