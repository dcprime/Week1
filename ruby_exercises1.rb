# Question 1
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbers.each do |num|
puts(num)
end
puts

# Question 2
numbers.each do |num|
  if num > 5
  puts(num)
end
end
puts

# Question 3
odd_numbers = numbers.select {|odd| odd%2 != 0}
puts odd_numbers
puts

# Question 4
numbers << 11
numbers.unshift(0)
puts numbers
puts

# Question 5
numbers.pop
numbers << 3
puts numbers
puts

# Question 6
numbers.uniq!
puts numbers

# Question 7
# An array stores elements and indexes them by an automatically assigned integer (starting at "0"),
# while a hash stores elements by key values which can be set by the user.