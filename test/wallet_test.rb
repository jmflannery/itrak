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

    it 'can add new income' do
      i = @wallet.add('first', 100, '2016-1-1')
      i.name.must_equal 'first'
      @wallet.data.size.must_equal 1
    end

    it 'assigns a unique id to each income' do
      @wallet.add('first', 1, '2016-1-1').id.must_equal 1
      @wallet.add('second', 1, '2016-1-2').id.must_equal 2
      @wallet.add('third', 1, '2016-1-3').id.must_equal 3
    end

    it 'sorts income by date' do
      @wallet.add('third', 1, '2016-3-3')
      @wallet.add('first', 1, '2016-1-1')
      @wallet.add('second', 1, '2016-2-2')
      @wallet.data.map(&:name).must_equal(%w(first second third))
    end
  end
end
