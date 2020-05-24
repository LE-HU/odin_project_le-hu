# Thanks Jordan Hudgens

def merge_sort(list)
  if list.size <= 1
    list
  else
    mid = (list.size / 2)
    left = merge_sort(list[0..mid - 1])
    right = merge_sort(list[mid..list.size])
    merge(left, right)
  end
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

funky_array = [1, 2, 41, 23, 44, 52, 8, 5, 29, 33]

sorted = merge_sort(funky_array)

print sorted
