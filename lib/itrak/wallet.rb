module ITrak
  class Wallet
    include Persistable

    def initialize(file)
      store file
    end

    def add(name, amount, date)
      income = Income.new(name, amount, date, next_id)
      data << income
      data.sort!
      income
    end

    def next_id
      (data.map(&:id).max || 0) + 1
    end

    def initial_data
      []
    end

    def to_s
      "<Wallet @income_list: #{data.inspect}>"
    end
    alias_method :inspect, :to_s
  end
end
