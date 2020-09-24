### ERROR: DOES NOT ACCOMODATE FOR LARGEST DIFFERENCE OCCURING BACKWARDS
###- SELL DAY FIRST - BUY DAY SECOND - what is impossible, abs value screws things up

# prices = [21, 42, 54, 45, 95, 23, 55, 33, 86, 11, 56, 8]
# prices = [4, 7, 2, 5, 15, 3]

# def stock(prices_by_day)
#   control_array = []

#   for i in (1...prices_by_day.length).to_a.reverse
#     for j in (1..i)
#       price_difference = prices_by_day[i] - prices_by_day[i - j]
#       control_array << [prices_by_day[i], prices_by_day[i - j], price_difference.abs]
#     end
#   end

#   best_deal = control_array.max_by { |miniarray| miniarray[2] }

#   puts "Best day to buy is - #{best_deal[0..1].min}"
#   puts "Best day to sell is - #{best_deal[0..1].max}"
#   puts "Price difference = #{best_deal[2]}"
# end

# stock(prices)

### FIXED VERSION BELOW

prices = Array.new(10).map { |elem| elem = rand(50) }

def stock(prices_by_day)
  control_array = []
  calendar_reversed = (0...prices_by_day.length).to_a.reverse

  for date in calendar_reversed
    for days_prior_to_date in (0..date)
      price_difference = prices_by_day[date] - prices_by_day[date - days_prior_to_date]
      if price_difference.positive?
        control_array << [date - days_prior_to_date,  # buy-day
                          date,                       # sell-day
                          prices_by_day[date - days_prior_to_date], # buy-price
                          prices_by_day[date],        # sell-price
                          price_difference]
      end
    end
  end

  # pick best deal miniarray by price difference
  best_deal_details = control_array.max_by { |miniarray| miniarray[4] }

  puts "Best day to buy is day #{best_deal_details[0] + 1} with stock price at #{best_deal_details[2]}"
  puts "Best day to sell is day #{best_deal_details[1] + 1} with stock price at #{best_deal_details[3]}"
  puts "Price difference = #{best_deal_details[4]}"
end

puts "*" * 80
print "Stock prices array is randomized: #{prices}\n"
puts "-" * 80
stock(prices)
puts "*" * 80
