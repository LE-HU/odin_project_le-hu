# bubble sort:)

def bubble(array_to_sort)

  for run in (1..array_to_sort.length) # defines number of algorithm runs
    for position in (0...(array_to_sort.length - run)) # defines number of comparisons per run
      if array_to_sort[position] > array_to_sort[position + 1]
        # let's swap them if n > n+1
        array_to_sort[position], array_to_sort[position + 1] = array_to_sort[position + 1], array_to_sort[position]
      end
    end
  end

  array_to_sort
end

print bubble([2, 5, 18, 4, 75, 1, 23, 26, 54, 32, 13])
