require_relative 'lib/itrak.rb'

wallet = ITrak::Wallet.new

# convert a float to a $US currency string
$us = -> (flt) {
  "$%.2f" % [flt]
}

incomes = wallet.data.map { |i| {
  name: i.name,
  amount: i.amount.to_f,
  date: i.date.iso8601,
  tax: i.income_tax,
  save: i.savings,
  leftover: i.left_over
}}

totals = {
  amount: 0.0,
  tax: 0.0,
  save: 0.0,
  leftover: 0.0
}

incomes.reduce(totals) do |t, i|
  t[:amount] += i[:amount]
  t[:tax] += i[:tax]
  t[:save] += i[:save]
  t[:leftover] += i[:leftover]
  t
end

name_width = incomes.map { |i| i[:name].size }.max
amount_width = $us.call(totals[:amount]).size
date_width = incomes.map { |i| i[:date].size }.max
tax_width = $us.call(totals[:tax]).size
save_width = $us.call(totals[:save]).size
leftover_width = $us.call(totals[:leftover]).size

# Header
puts "Name".center(name_width) + " " + "Amount".center(amount_width) + " " + "Date".center(date_width) + " " + "Tax".center(tax_width) + " " + "Save".center(save_width) + " " + "Left".center(leftover_width)
puts "-" * ((name_width + amount_width + date_width + tax_width + save_width + leftover_width) + 5)

# Income list
incomes.each do |i|
  puts i[:name].ljust(name_width) + ' ' + $us.call(i[:amount]).rjust(amount_width) + ' ' + i[:date].ljust(date_width) + ' ' + $us.call(i[:tax]).rjust(tax_width) + ' ' + $us.call(i[:save]).rjust(save_width) + ' ' + $us.call(i[:leftover]).rjust(leftover_width)
end

# Totals
puts "-" * ((name_width + amount_width + date_width + tax_width + save_width + leftover_width) + 5)
puts 'Total:'.ljust(name_width) + ' ' + $us.call(totals[:amount]).rjust(amount_width) + ' ' + ''.ljust(date_width) + ' ' + $us.call(totals[:tax]).rjust(tax_width) + ' ' + $us.call(totals[:save]).rjust(save_width) + ' ' + $us.call(totals[:leftover]).rjust(leftover_width)
