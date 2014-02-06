# Destination directory
Dir.chdir 'C:/users/darren/desktop/tech exercises/ruby/picsource'

# Source directory
pic_names = Dir['C:/users/darren/desktop/tech exercises/ruby/week1/picdestination/*.jpg']

puts 'What would you like to call this batch?'
batch_name = gets.chomp
puts

print "Downloading #{pic_names.length} files: "
pic_number = 1

pic_names.each do |name|
  print '.' # This is our "progress bar".
  new_name = if pic_number < 10
      "#{batch_name}0#{pic_number}.jpg"
    else
      "#{batch_name}#{pic_number}.jpg"
  end
	if File.exist?(new_name)
	  puts "#{new_name} already exists! Please rename to avoid overwriting!"
		exit
	else
    File.rename name, new_name
    pic_number = pic_number + 1
	end
end

puts
puts 'Done, big guy!'