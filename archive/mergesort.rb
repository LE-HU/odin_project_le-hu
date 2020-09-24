## BROKEN AT THIS MOMENT

# split array into endless single element arrays
# merge them one by one sorted, to grow in size 1-2-4-8 etc
# merge final two arrays and voila.

# arrays used in our algorithm
array_to_sort = [1, 2, 41, 23, 44, 52, 8, 5, 29, 33]
divided_array = []

# divide, to n one element arrays (can't divide any dividier :))
divided_array = array_to_sort.each_slice(1).to_a
print divided_array

# main body, here goes the magic
def merge_sort_level_one(main_array)
  helper_array = []
  main_array.each_with_index do |v, i|
    if main_array[i][0] < main_array[-(i + 1)][0]
      helper_array[i] = []
      helper_array[i] << main_array[i][0]
      helper_array[i] << main_array[-(i + 1)][0]
    else
      helper_array[i] = []
      helper_array[i] << main_array[-(i + 1)][0]
      helper_array[i] << main_array[i][0]
    end
  end
  # TODO: if pierwszy array .odd? to cza dodać + 1 do take aby nie ujebywal ostatniej miniarrayki
  main_array = helper_array.take(helper_array.size / 2)
end

final_array = merge_sort_level_one(divided_array)
puts ""
puts array_to_sort.size
puts ""
print final_array
puts ""
puts final_array.size
puts ""

def merge_sort_level_two(main_array)
  helper_array = []
  main_array.each_with_index do |v, i|
    main_array[i]
    main_array[-(i + 1)]

    if main_array[i] == main_array[-(i + 1)]
      #to fin
    end
  end
end

even_more_final_array = merge_sort_level_two(final_array)
print even_more_final_array
puts ""
puts even_more_final_array.size
puts ""

# array_to_sort = [1, 2, 41, 23, 44, 52, 8, 5, 29, 33]
# split_array = array_to_sort.each_slice(1).to_a
# arr1 = []
# arr1[0] = []
# arr1[0] << split_array[0][0]
# arr1[0] << 5
# print arr1
