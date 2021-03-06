require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.
# An unused space in the restricted array has the 'SPECIAL_VALUE'
SPECIAL_VALUE = 9999

## Calculates the length of the restricted integer array_size
def length(array)
  i = 0
  while array[i]
    i += 1
  end
  return i
end

# Prints each integer values in the array

def print_array(array)
  # puts "NOT IMPLEMENTED"
  i = 0
  # array_as_string = ""
  while array[i]
    # array_as_string += array[i].to_s + " "
    # i += 1
    # if you want to list each value on its own line, replace the two lines above with:
    p array[i]
  end
  # p array_as_string
end

# Reverses the values in the integer array
def reverse(array, length) # Ruby
  return array if length == 1
  # can use the variable length throughout or create a clone because
  # using the variable length to track index is akward
  j = length
  (length / 2).times do |i|
    j -= 1
    array[i], array[j] = array[j], array[i]
  end

  return array
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  # puts "NOT IMPLEMENTED"
  length.times { |i| return true if value_to_find == array[i] }
  return false
end

# Sorts the array in ascending order.
# selection sort? merge sort? any sort algo we want?
def sort(array, length)
  (length - 1).times do |i|
    index_min = i

    j = i + 1
    (length - j).times do
      index_min = j if array[j] < array[index_min]
      j += 1
    end

    array[i], array[index_min] = array[index_min], array[i]
  end

  return array
end

# Restricted arrays cannot be resized. So, we follow a convention.
# Convention: change the value to be deleted with 'SPECIAL_VALUE'
# Deletes 'value_to_delete' if found in the array. To keep the array size
# constant, adds an element with 'SPECIAL_VALUE' in the end. Assumes the array
# to be sorted in ascending order.
# SPECIAL_VALUE should be at end - move all entrys forwards after you remove
def delete(array, length, value_to_delete)
  # puts "NOT IMPLEMENTED"
  length.times do |i|
    if array[i] == value_to_delete
      array[i] = SPECIAL_VALUE
      break
    end
  end
  return array
end

# Restricted array cannot be resized. So, we workaround by having a convention
# Convention: replace all values with 'SPECIAL_VALUE'
# Empties the restricted array by making all values = SPECIAL_VALUE
# if SPEICAL_VALUE is always suppose to be inserted at the end, 
def empty(array, length)
  # puts "NOT IMPLEMENTED"
  length.times { |i| array[i] = SPECIAL_VALUE }
end

# Finds and returns the largest value element in the array which is not 'SPECIAL_VALUE'
# Assumes that the array is not sorted.
def find_largest(array, length)
  # puts "NOT IMPLEMENTED"
  largest = array[0]
  length.times { |i| largest = array[i] if array[i] > array[0] && array[i] != SPECIAL_VALUE }
  return largest
end

# Insert value to insert at the correct index into the array assuming the array
# is sorted in ascending manner.
# Restricted arrays cannot be resized. Insert only if there is space in the array.
# (Hint: if there are NO elements with 'SPECIAL_VALUE', there is no room to insert)
# All subsequent elements will need to be moved forward by one index.
## GOOD IDEA TO USE BINARY SORT WHEN YOU KNOW ARRAY IS SORTED - WILL IMPROVE TIME COMPLEX
def insert_ascending(array, length, value_to_insert)
  if search(array, length, SPECIAL_VALUE)

    length.times do |i|
      if value_to_insert < array[i]
        j = length - 1
        (length - 1 - i).times do
          array[j] = array[j - 1]
          j -= 1
        end
        array[i] = value_to_insert
        break
      end
    end

    return array
  else
    return "ERROR - no room"
  end
end

## --- END OF METHODS ---

# A restricted array could be constructed of a given size like so
size = 5
my_integer_array = RestrictedArray.new(size)
my_integer_array_length = length(my_integer_array)
puts "The length of my integer array is #{my_integer_array_length}, which should be the same as #{size}."
puts "BUG!" if my_integer_array_length != size
puts

# A restricted array could be constructed of a random size (1 to 20) like so
another_array = RestrictedArray.new()
another_array_length = length(another_array)
puts "The length of my random length, integer array is #{another_array_length}."
puts

# print the current array
print "Printing values in the array: "
print_array(another_array)
# reverse the values in the current array
reverse(another_array, another_array_length)
# prints the reversed array
print "Reversed array: "
print_array(another_array)
puts

# search for value_to_find in the array
value_to_find = 120
if search(another_array, another_array_length, value_to_find)
  puts "#{value_to_find} found in the array!"
else
  puts "#{value_to_find} not found in the array!"
end
puts

# search for value_to_find in the array - find the last value
value_to_find = another_array[another_array_length-1]
if search(another_array, another_array_length, value_to_find)
  puts "#{value_to_find} found in the array!"
else
  puts "#{value_to_find} not found in the array!"
  puts "BUG! #{value_to_find} should be at index #{another_array_length-1}"
end
puts

# print the largest value in the array
largest = find_largest(another_array, another_array_length)
puts "The largest value in the array is #{largest}"
puts

# sort the array
sort(another_array, another_array_length)
print "Array sorted in ascending order: "
print_array(another_array)
puts

# delete the first entry with the value_to_delete
value_to_delete = another_array[another_array_length/2]
delete(another_array, another_array_length, value_to_delete)
print "#{value_to_delete} deleted from array: "
print_array(another_array)
puts

# delete the first entry with the value_to_delete
value_to_delete = another_array[another_array_length/2]
delete(another_array, another_array_length, value_to_delete)
print "#{value_to_delete} deleted from array: "
print_array(another_array)
puts

# print the largest value in the array
largest = find_largest(another_array, another_array_length)
puts "The largest value in the array is #{largest}"
puts

# sort the array
sort(another_array, another_array_length)
print "Array sorted in ascending order: "
print_array(another_array)
puts

# insert 123 in to the array sorted in ascending order
value_to_insert = 123
insert_ascending(another_array, another_array_length, value_to_insert)
print "#{value_to_insert} inserted into the array: "
print_array(another_array)
puts

# empty array
empty(another_array, another_array_length)
print "Emptied array looks like: "
print_array(another_array)
puts

# insert 123 in to the array sorted in ascending order
value_to_insert = 123
insert_ascending(another_array, another_array_length, value_to_insert)
print "#{value_to_insert} inserted into the array: "
print_array(another_array)
puts
