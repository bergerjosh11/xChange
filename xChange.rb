require 'rest-client'
require 'json'

# Get a list of all available currencies
base_url = 'https://api.exchangeratesapi.io/latest'
params = {base: 'USD'}

response = RestClient.get(base_url, params: params)
data = JSON.parse(response.body)

currencies = data['rates'].keys

# Prompt the user to select two currencies
puts "Select two currencies to compare from the following list:"
puts currencies.join(', ')
print "Currency 1: "
currency1 = gets.chomp.upcase
print "Currency 2: "
currency2 = gets.chomp.upcase

# Get the exchange rate between the selected currencies
params = {base: currency1, symbols: currency2}

response = RestClient.get(base_url, params: params)
data = JSON.parse(response.body)

exchange_rate = data['rates'][currency2]

puts "1 #{currency1} = #{exchange_rate} #{currency2}"
