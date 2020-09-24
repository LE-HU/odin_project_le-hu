# Write a method #fib which takes a number and returns that many members
# of the fibonacci sequence. Use iteration for this solution.

# arrayless version
# implemented using golden ratio algorithm
def fib(n)
  n += 2
  n.times do |num|
    if num == 0
      next
    elsif num == 1
      next
    else
      print "#{(1.618034 ** num - (1 - 1.618034) ** num) * 1 / Math.sqrt(5)}".to_i
      print ", "
    end
  end
  puts "*****"
end

fib(10)

# no state record version, returns the last fib number
# ***********************
# def fib_rec(n)
#   return 0 if n == 0
#   return 1 if n == 1
#   fib_rec(n - 2) + fib_rec(n - 1)
# end

# the one that actually displays the numbers:
def fib_rec(n)
  return (0..n).reduce([]) { |a, v| a << v } if n < 2
  prev = fib_rec(n - 1)
  prev << prev[-2] + prev[-1]
end

print fib_rec(10)
