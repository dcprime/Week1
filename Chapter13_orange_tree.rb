class OrangeTree

  def initialize
    @height = 0
    @age = 0
    @alive = true
    @oranges = 0
  end

  def height
    puts "Your orange tree is #{@height} feet tall"
  end

  def one_year_passes
  @oranges = 0
  @age += 1
    if @alive == true
       @height += 1.5
      if @age >= 3
        @oranges = (@age * 2)
      end
    end
    if @age > 15
      @alive = false
      @oranges = 0
      puts 'At 16 years, your orange tree reached the end of its life'
    end
    puts "Your orange tree is now #{@age} years old"
  end
  
  def count_the_oranges
    puts "There are currently #{@oranges} oranges on the tree"
  end
  
  def pick_an_orange
    if @oranges >= 1
      @oranges -= 1
      status = ['That was a particularly delicious orange!', 'That orange tasted pretty good!', 'That orange could have been better', 'That orange tasted pretty good!']
      puts status[rand(4)]      
    else
      puts 'Sorry, there are no more oranges to pick this year!'
    end
  end
  
end

tree = OrangeTree.new
tree.one_year_passes
tree.height
tree.one_year_passes
tree.one_year_passes
tree.count_the_oranges
tree.pick_an_orange
tree.pick_an_orange
tree.pick_an_orange
tree.count_the_oranges
tree.pick_an_orange
tree.pick_an_orange
tree.pick_an_orange
tree.pick_an_orange
tree.one_year_passes
tree.one_year_passes
tree.one_year_passes
tree.height
tree.one_year_passes
tree.one_year_passes
tree.count_the_oranges
tree.one_year_passes
tree.one_year_passes
tree.one_year_passes
tree.height
tree.one_year_passes
tree.count_the_oranges
tree.one_year_passes
tree.one_year_passes
tree.one_year_passes
tree.count_the_oranges
tree.height
tree.one_year_passes
tree.count_the_oranges
tree.height
tree.one_year_passes
tree.height