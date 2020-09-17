to_sort = Array.new(10).map { |elem| elem = rand(50) }

def bubble_sort(array)
  # for x element array there's x - 1 comparisons between elements
  for run in (2..array.size)
    swapped = false
    # each run requires y less comparisons as "back of the array" is already sorted
    for compared_index in (0..array.size - run)
      if array[compared_index] > array[compared_index + 1]
        array[compared_index], array[compared_index + 1] = array[compared_index + 1], array[compared_index]
        swapped = true
      end
    end
    # early break if any run returns zero swaps
    break if not swapped
  end
  array
end

puts "Elements to be sorted:"
print to_sort
puts ""
puts "*" * 40
puts "Sorted array:"
print bubble_sort(to_sort)
puts ""
