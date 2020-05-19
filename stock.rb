# prices = [21, 42, 54, 45, 95, 23, 55, 33, 86, 11, 56, 8]
prices = [4, 7, 2, 5, 15, 3]

def stock(prices_by_day)
  control_array = []

  for i in (1...prices_by_day.length).to_a.reverse
    for j in (1..i)
      price_difference = prices_by_day[i] - prices_by_day[i - j]
      control_array << [prices_by_day[i], prices_by_day[i - j], price_difference.abs]
    end
  end

  best_deal = control_array.max_by { |miniarray| miniarray[2] }

  puts "Best day to buy is - #{best_deal[0..1].min}"
  puts "Best day to sell is - #{best_deal[0..1].max}"
  puts "Price difference = #{best_deal[2]}"
end

stock(prices)
