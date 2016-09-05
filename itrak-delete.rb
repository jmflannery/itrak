require_relative 'lib/itrak.rb'

id     = 0
wallet = ITrak::Wallet.new(WALLET_STORE)

OptionParser.new do |opts|
  opts.banner = "Usage: itrak-delete.rb [options]"

  opts.on('-iID', '--id=ID', 'ID of Income to delete') do |n|
    id = n
  end
end.parse!

wallet.delete(id).save if id
