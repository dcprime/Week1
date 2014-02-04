player_cards = []
dealer_cards = []
player_value = 0
dealer_value = 0
choice = ''

# Generate a random card (returns card)
def random_card
suit = [' of hearts', ' of spades', ' of diamonds', ' of clubs']
rank = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
	card_rank = rank[rand(13)]
	card_suit = suit[rand(4)]
	card = card_rank.to_s + card_suit
  card
end

# Check if card has been already dealt
def deal recipient_array, other_array 
  dealt_card = random_card
	dealt_array = recipient_array + other_array
	if dealt_array.include?(dealt_card) == true
	  deal recipient_array, other_array
  else
	  return dealt_card
  end
end

# Use these 2 methods for generating player card or dealer card
def deal_player player_array, dealer_array
  card = deal player_array, dealer_array
  player_array << card
  return card	
end

def deal_dealer dealer_array, player_array
  card = deal dealer_array, player_array
  dealer_array << card
  return card	
end

# Methods for generating card values
def array_num_total array
  i = 0
	num_total = 0
	integer_array = array.collect { |item| item.to_i }
	while i < integer_array.length
	  num_total = integer_array[i] + num_total
		i = i + 1
	end
  num_total
end

def face_card_total array
  face_total = 0
  face_array = array.collect { |item| item[0] }
	face_array.delete_if { |item| item.to_i > 0 || item == 'A'}
	face_total = face_array.length * 10
	face_total
end

# Use this method for generating card array total values
def card_total array
  i = 0
  total = 0
	ace_value = 0
	ace_array = []
	array_test = []
	total = (array_num_total array) + (face_card_total array)
	ace_array = array.select { |item| item[0] == 'A' }
	array_test = array.each { |item| item[0] }
	if (ace_array.length == 1) && (total == 10) 
	  total = 21
		return total
	end
	if ace_array.eql?(array_test)
	  total = 10 + ace_array.length
		return total
	end
	  while i < ace_array.length
		  if total + 11 >= 21
			  ace_value = 1
			else
			  ace_value = 11
			end
      total = total + ace_value 
			i = i + 1
		end
  total
end

# Dealer sequence for total dealer cards & value
def dealer_sequence d_cards, p_cards
  deal_dealer d_cards, p_cards
  value = card_total d_cards
    while value <= 21
      if value < 17
	      deal_dealer d_cards, p_cards
        value = card_total d_cards
  	  else
  		  return value
  	  end
    end
	return value	
end

deal_dealer dealer_cards, player_cards
dealer_value = card_total dealer_cards
2.times do
deal_player player_cards, dealer_cards
end
player_value = card_total player_cards

puts 'Welcome to Ruby Blackjack!'
puts 'Dealer is showing ' + dealer_cards.to_s + ' Total => ' + dealer_value.to_s

while (player_value < 21) && (choice.downcase != 's')
  puts 'You have ' + player_cards.to_s + ' Total => ' + player_value.to_s
  puts 'Would you like to [H]it or [S]tay?'
  choice = gets.chomp
    if choice.downcase == 'h'
  	  deal_player player_cards, dealer_cards
  		player_value = card_total player_cards
 		elsif choice.downcase == 's'
		  player_value = player_value
		else
 		  puts 'Please enter [H] for Hit or [S] for stay'
 		end  
end

dealer_value = dealer_sequence dealer_cards, player_cards
if player_value > 21 
  puts 'You have ' + player_cards.to_s + ' Total => ' + player_value.to_s + ' - BUSTED! You lose!'
elsif player_value == dealer_value
  puts 'You have ' + player_cards.to_s + ' Total => ' + player_value.to_s
  puts 'Dealer has ' + dealer_cards.to_s + ' Total => ' + dealer_value.to_s + ' - TIE! Try again!'
elsif (player_value == 21) && (player_cards.length == 2)
  puts 'You have ' + player_cards.to_s + ' Total => ' + player_value.to_s + ' - BLACKJACK! You win!'
elsif dealer_value > 21
  puts 'You have ' + player_cards.to_s + ' Total => ' + player_value.to_s
  puts 'Dealer has ' + dealer_cards.to_s + ' Total => ' + dealer_value.to_s + ' - DEALER BUSTED! You win!'
elsif player_value > dealer_value
  puts 'You have ' + player_cards.to_s + ' Total => ' + player_value.to_s
  puts 'Dealer has ' + dealer_cards.to_s + ' Total => ' + dealer_value.to_s + ' - YOU WIN! Yay!'
else
  puts 'You have ' + player_cards.to_s + ' Total => ' + player_value.to_s
  puts 'Dealer has ' + dealer_cards.to_s + ' Total => ' + dealer_value.to_s + ' - YOU LOSE! Sorry!'
end

