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
        total = 0

        @items.each do |item, quantity|
            puts "#{item}: #{quantity}"
            total += @prices[item] * quantity
        end

        puts "Total: %.2f" % [total]
    end
end
