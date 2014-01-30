# Question 8
# Ruby 1.8 syntax:
# { "first" => 1st, "second" => 2nd }
# Ruby 1.9 syntax:
# Hash[ [ ["a", 100], ["b", 200] ] ]

# Question 9
h = {a:1, b:2, c:3, d:4}
puts h[:b]

# Question 10
h[:e] = 5
puts h

# Question 13
h.delete_if {|key, value| value <= 3.5 }
puts h

# Question 14
# Yes, hash values can be arrays. Eg.: hash  = { "a"=>[1, 2, 3], "b"=>[18, 21, 9] }
# Yes, you can have an array of hashes Eg. below:
array = []
g = {f:6, g:7}
array.push(h)
array[1] = g
puts array.to_s

# Question 15
# Having had virtually no experience with Ruby API sources, I would have to say
# that I like http://www.ruby-doc.org/ the best so far. It looks like there are 
# a lot of resources and the information is well-organized and easy to find.