module ITrak
  class Income
    include Comparable

    attr_reader :name, :amount, :date, :id

    def initialize(name, amount, date, id)
      @name = name
      @amount = BigDecimal(amount)
      @date = Date.parse(date)
      @id = id
    end

    def income_tax
      (amount.to_f * TAX_PERCENTAGE / 100).round(2)
    end

    def savings
      (amount.to_f * SAVINGS_PERCENTAGE / 100).round(2)
    end

    def left_over
      amount.to_f - income_tax - savings
    end

    def <=>(other)
      other.is_a?(Income) && date <=> other.date
    end

    def to_s
      "<Income name: '#{name}' amount: $#{amount.to_f} date: #{date.rfc822} income_tax: #{income_tax} savings: #{savings} left_over: #{left_over}>"
    end

    alias_method :inspect, :to_s
  end
end
