class Checkout
    def initialize(prices)
        @prices = prices
        @items = Hash.new(0)
    end

    def scan(item)
        # TODO: check if item is valid

        @items[item] += 1
    end

    def total
        # all items here have already been validated

        total = 0

        @items.each do |item, quantity|
            puts "#{item}: #{quantity}"

            total += case item
            when "VOUCHER"
                5 * (quantity / 2.0).ceil
            when "TSHIRT"
                (quantity >= 3 ? 19 : 20) * quantity
            when "MUG"
                7.50 * quantity
            end
        end

        puts "Total: %.2f" % [total]
    end
end
