require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/itrak.rb'

module ITrak
  describe Income do

    before do
      @income = Income.new('Paycheck', 600, '2016-9-3', 22)
    end

    it 'initializes' do
      @income.name.must_equal 'Paycheck'
      @income.amount.must_equal BigDecimal.new(600)
      @income.date.must_equal Date.new(2016, 9, 3)
      @income.id.must_equal 22
    end

    it 'know the income tax to be saved' do
      @income.income_tax.must_equal 180
    end

    it 'know the how much should be put away for savings' do
      @income.savings.must_equal 60
    end

    it 'knows how much is left after tax and savings' do
      @income.left_over.must_equal 360
    end
  end
end
