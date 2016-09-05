require 'minitest/autorun'
require 'minitest/pride'
require 'fileutils'
require_relative '../lib/itrak.rb'

module ITrak
  describe Wallet do
    before do
      @file = 'test.pstore'
      @wallet = Wallet.new(@file)
    end

    after do
      FileUtils.rm @file
    end

    it 'is initially empty' do
      @wallet.data.must_be_empty
    end

    it 'can add income' do
      @wallet.add(Income.new('first', 1, '2016-1-1'))
      @wallet.data.size.must_equal 1
    end

    it 'sorts income by date' do
      @wallet.add(Income.new('third', 1, '2016-3-3'))
      @wallet.add(Income.new('first', 1, '2016-1-1'))
      @wallet.add(Income.new('second', 1, '2016-2-2'))
      @wallet.data.map(&:name).must_equal(%w(first second third))
    end
  end
end
