class CashRegister

    attr_reader :discount
    attr_accessor :total
    attr_accessor :items
    attr_accessor :last_add

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = Array.new
        @last_add = Array.new
    end

    def add_item (title, price, quantity = 1)
        quantity.times { self.items = @items.push(title) }
        self.last_add = [ title, price, quantity ]
        self.total = @total + ( price * quantity )
    end

    def apply_discount
        if @discount > 0
            self.total = ( @total - ( @total * @discount / 100 ) )
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        title, price, quantity = @last_add
        self.total = @total - ( price * quantity )
        self.items = @items - %w[ title * quantity ]
    end

end