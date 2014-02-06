# I added the feature of allowing the user to create the list from a keyword.
puts 'Create a shuffled playlist with songs containing your chosen word in the filename'
print 'What is your chosen word? =>'

# Spaces added around chosen keyword to avoid getting 'Garfunkle' when searching for 'fun'.
word = ' ' + gets.chomp + ' '

# Destination file name for playlist. Contains chosen search word in file name.
filename = "c:/users/darren/music/darren's mp3s/Shuffledplaylist - #{word}.m3u"

# Destination file name for a pure .txt file for generated playlist (for my own reference)
textfile = "c:/users/darren/music/playlists/Shuffledplaylist - #{word}.txt"

# Music source directory
Dir.chdir "c:/users/darren/music/darren's mp3s"

playlist = Dir["**/*#{word}*.*"]

def shuffle array
shuffled = []
i = 0
  while i < array.length
  score = rand(array.length) 
    if shuffled[score] != nil
	  while shuffled[score] != nil
	  score = rand(array.length)
	  end
	end
  shuffled[score] = array[i]
  i = i+1
  end
shuffled
end

output = (shuffle playlist)

# Writes the playlist file
File.open filename, 'w' do |f|
  output.each {|item| f.puts item}
end 

# Writes the text file
File.open textfile, 'w' do |f|
  output.each {|item| f.puts item}
end 

puts 'Your playlist is ready!'