
hearts = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11}
spades = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11}
clubs = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11}
diamonds = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11}

#[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']

deck = [hearts, spades, diamonds, clubs]

def draw_card(deck, x=1)
  Hash[deck.sample.to_a.sample(x)]
end

player_hand = {}

def first_turn(player_hand, draw_card, deck)
  player_hand.merge!(draw_card(deck, 2))
  puts "you have #{player_hand.keys.join(' and ')}"
end

def hit(player_hand, draw_card, deck)
  player_hand.merge!(draw_card(deck, 1))
  puts "you have #{player_hand.keys.join(' and ')}"
end

def player_score(player_hand)
  score = 0
  
  player_hand.each {|k, v| score = score + v}
  
  score -= 10 if score > 21 && player_hand.has_key("ace")
    
  puts score
end

first_turn(player_hand, draw_card(deck), deck)

player_score(player_hand)

puts "would  you like a hit?"
answer = gets.chomp 

hit(player_hand, draw_card(deck), deck)


player_score(player_hand)


  

  
  
