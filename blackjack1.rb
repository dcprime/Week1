player_cards = []
dealer_cards = []
player_value = 0
dealer_value = 0

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



# Generate 1 dealer card **(random_card + dealt_check) + add to dealer_cards array**
# Generate dealer total **iterate over dealer_cards array (with Ace check)**
# Generate 2 player cards **(random_card + dealt_check) + add to player_cards array**
# Generate player total **iterate over player_cards array (with Ace check)**
#   If player blackjack, do dealer card sequence
# Player input: [H]it or [S]tay
#   If 'Hit', generate 1 player card
#   Generate player total (with 'Ace check')
#     If 'bust' dealer wins
#     Else player input (loop till 'stay' or 'bust')
#   If 'Stay', do dealer card sequence
#   Else 'Please enter [H]it or [S]tay
# Dealer card sequence:
# Generate 1 dealer card
# Generate dealer total (with 'Ace check')
#   If dealer blackjack, compare totals
#   If dealer total < 17 generate 1 dealer card (loop)
#   If dealer total >= 17 stay
# Compare totals
#   If player total > dealer total, player wins
#   If dealer total > player total, dealer wins
#   If player total = dealer total, tie 

# Generate random card
# Check if card was dealt
# If already dealt, generate a new card
# If not already dealt 
#  (1) add card to dealt array, 
#  (2) calculate card value
#  (3) add card value to player or dealer

