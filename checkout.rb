class Checkout
    def initialize(pricing_rules)
        @pricing_rules = pricing_rules
        @items = Hash.new(0)
    end

    def scan(item)
        # TODO: check if item is valid

        @items[item] += 1
    end

    def total
        # all items here have already been validated

        total = 0

        # order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
        @items.each do |item, quantity|
            puts "#{item}: #{quantity}"

            total += @pricing_rules.price_for(item, quantity)
        end

        puts "Total: %.2f" % [total]
    end
end
