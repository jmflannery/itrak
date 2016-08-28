class Income
  attr_reader :name, :amount, :date

  def initialize(name, amount, date)
    @name = name
    @amount = BigDecimal(amount)
    @date = Date.parse(date)
  end

  def to_s
    "<Income name: '#{name}' amount: $#{amount.to_f} date: #{date.rfc822}>"
  end

  alias_method :inspect, :to_s
end
