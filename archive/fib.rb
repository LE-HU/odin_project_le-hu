# # fibonacci normaliacci
# fibo = [0, 1]
# puts "Enter fibo numbero"
# how_many = gets.chomp.to_i

# how_many.times do |elem|
#   fibo << fibo[-2] + fibo[-1]
# end

# print fibo

## FIBO RECURSIVELY
puts "enter fibo numbero"
fibnums = gets.chomp.to_i
n = [0, 1]

def fib(n, fibnums)
  n << n[-2] + n[-1]
  fib(n, fibnums - 1) unless fibnums == 0
end

fib(n, fibnums)

print n
