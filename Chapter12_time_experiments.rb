# File for practicing the Time class

# One billion seconds from my birth
birth = Time.local(1975, 7, 20, 17, 36, 06) 
billion = birth + 1000000000
puts billion

# Answer = March 28, 2007, 7:22pm and 46 seconds!

# SPANK program. Yes, that's what I'm calling it.

spankarray = []
spank = 'SPANK!'
puts 'Welcome to the Birthday SPANK program! You did not misread that!'
puts 'What year were you born?'
year = gets.chomp

puts 'And what month? (please enter a number)'
month = gets.chomp

puts 'Finally, what date? (once again, please enter a number)'
date = gets.chomp

number = (Time.new - Time.local(year, month, date)) / 60 / 60/ 24 / 365
puts "#{number.to_i} SPANKS coming your way!"

number.to_i.times { spankarray << spank }
puts spankarray.to_s