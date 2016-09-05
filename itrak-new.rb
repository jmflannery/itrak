require_relative 'lib/itrak.rb'

inc    = {}
wallet = ITrak::Wallet.new(WALLET_STORE)

OptionParser.new do |opts|
  opts.banner = "Usage: itrak-new.rb [options]"

  opts.on('-nNAME', '--name=NAME', 'Name of Income') do |n|
    inc[:name] = n
  end

  opts.on('-aAMOUNT', '--amount=AMOUNT', 'Amount of Income') do |n|
    inc[:amount] = n
  end

  opts.on('-dDATE', '--date=DATE', 'Date of Income') do |n|
    inc[:date] = n
  end
end.parse!

income = Income.new(inc[:name], inc[:amount], inc[:date])
wallet.add(income)
wallet.save
