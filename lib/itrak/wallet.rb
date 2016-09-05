module ITrak
  class Wallet
    include Persistable

    def initialize(file)
      store file
    end

    def add(income)
      data << income
      data.sort!
      self
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
