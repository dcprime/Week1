# Program to change Roman numerals to regular numbers

# Calculate total of portion of Roman numerals which contain '9' or '4'
def roman_specials roman_numeral
  del_index = 0
  specials_total = 0
  specials = {}
	specials['CM'] = 900
	specials['CD'] = 400
	specials['XC'] = 90
	specials['XL'] = 40
	specials['IX'] = 9
  specials['IV'] = 4
    specials.each do |k, v| 
      while roman_numeral.upcase.include?(k)
	      specials_total = specials_total + v
		    del_index = roman_numeral.upcase.index(k)
		  2.times {roman_numeral.slice!(roman_numeral[del_index])}
	    end
    end
  specials_total
end

# Calculate total of remaining portion of Roman numerals
def roman_regulars roman_numeral
  regulars_total = 0
  regulars = {}
  regulars['M'] = 1000
  regulars['D'] = 500
  regulars['C'] = 100
  regulars['L'] = 50
  regulars['X'] = 10
  regulars['V'] = 5
  regulars['I'] = 1
    regulars.each do |k, v| 
      if roman_numeral.include?(k)
	    regulars_total = regulars_total + ((roman_numeral.count k) * v)
		roman_numeral.delete!(roman_numeral[k])
	  end
    end
  regulars_total
end

puts 'Welcome to the Roman Numeral Interpreter!'
puts 'Enter any Roman numeral and press [Enter]'
puts 'The regular number will then be returned'
print 'Enter Roman numeral here => '
roman = gets.chomp.upcase

check = roman.upcase.delete("MDCLXVI")
if check.length > 0 
  puts 'This is not a valid Roman numeral!'
	exit
end

total = (roman_specials roman) + (roman_regulars roman)

puts "Your converted number is: #{total}"