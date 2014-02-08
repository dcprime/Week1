# The program extends the Array class 

class Array
  def mix
  shuffled = []
  i = 0
    while i < self.length
    score = rand(self.length) 
      if shuffled[score] != nil
	    while shuffled[score] != nil
	    score = rand(self.length)
	    end
	  end
    shuffled[score] = self[i]
    i = i+1
    end
  puts shuffled
  end
end

wordlist = ['first', 'second', 'third', 'fourth', 'fifth']
puts wordlist.mix