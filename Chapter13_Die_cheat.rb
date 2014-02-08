class Die

  def initialize
    roll
  end

  def roll
    @number_showing = 1 + rand(6)
  end
  
  def showing
    @number_showing
  end
  
  def cheat number
    if number > 6 || number < 1
      puts 'not a valid Die setting'
    else
    @number_showing = number
    end
  end
  
end

