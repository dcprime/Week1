# Two arrays used for selection of cards being dealt
suit = [' of hearts', ' of spades', ' of diamonds', ' of clubs']
rank = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
# Array to store which cards have already been dealt
dealt = []
# Two variables to store the values (totals) of each hand - player and dealer
player_value = 0
dealer_value = 0

# In this method the recipient would be either the player or dealer, 
# so when the method is called, it's called as 'deal player' or 'deal dealer'
def deal recipient
	# Get a random card rank from the 'rank' array above
	card_rank = rank[rand(13)] 
	# Get a random card suit from the 'suit' array above
	card_suit = [rand(4)]
		# Statements to set returned card value (or add it to existing total value of cards)
		# for either the 'player' or 'dealer' (depending on which was passed to the method)
		if card_rank == ('Jack' || 'Queen' || 'King')
			# card value is '10' for ranks that are strings (apart from 'Ace')
			recipient + '_value' = 10
			# Calculate card value for Ace (needs to be re-done to accommodate cards dealt after
			# 'Ace' that might cause bust if Ace valued at 11, but for now let's try this)
			elsif card_rank == 'Ace'
				if (recipient + 'value') + 11 > 21
					recipient + 'value' = 1
				else
					recipient + 'value' = 11
				end
			else 
				# Card value is equal to the integer value of chosen 'rank' array slot
				recipient + '_value' = (recipient + '_value') + card_rank 
		end
	# Generate the name of the card dealt (eg. 'Jack of hearts' or '6 of spades')
	card = card_rank.to_s + card_suit
		# Check the 'dealt' array to see if this card has already been dealt. If so,
		# run 'deal recipient' again (need to reset calculated value?)
		while dealt.each { |dealt_card| dealt_card == card }
			deal recipient
		end
	# Add the dealt card to the 'dealt' array
	dealt << card
	# Return the name of the card
	card
end

card_rank = rank[rand(13)] 
card_suit = suit[rand(4)]
card = card_rank.to_s + card_suit
