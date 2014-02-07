# Program for reading birthdays from .txt file

birthdates ={}

# Stole this part from the solution in the book (sorry!)
File.read('birthdays.txt').each_line do |line|
  line = line.chomp
	first_comma = 0
	while line[first_comma] != ',' && 
	    first_comma < line.length
		first_comma = first_comma + 1
	end
	name = line[0..(first_comma - 1)]
	date = line[(first_comma + 2)..-1]
	birthdates[name] = date
end
 
# Wrote the rest of this myself, though!
 
puts 'Whose birthday would you like to find?'
request = gets.chomp

if birthdates.has_key?(request)
  puts "#{request}'s birthday is #{birthdates[request]}"
	else
	puts "Sorry, no birthday information for #{request}"
end