require 'optparse'
require 'bigdecimal'
require 'date'
require 'pstore'
require 'fileutils'

require_relative 'itrak/persistable.rb'
require_relative 'itrak/wallet.rb'
require_relative 'itrak/income.rb'

TAX_PERCENTAGE = 30
SAVINGS_PERCENTAGE = 10
WALLET_STORE = 'store/wallet.pstore'
