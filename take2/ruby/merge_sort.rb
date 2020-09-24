# Merge Sort
to_be_sorted = Array.new(100).map { |x| x = rand(100) }

puts "Array to be sorted:"
print to_be_sorted
puts "\nOK"

def merge_sort(input_array)
  return input_array if input_array.size <= 1
  left = input_array.slice!(0, input_array.size / 2)
  right = input_array

  left = merge_sort(left)
  right = merge_sort(right)

  return merge(left, right)
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.size], right)
  else
    [right.first] + merge(left, right[1..right.size])
  end
end

puts "Sorted Array:"
print merge_sort(to_be_sorted)
