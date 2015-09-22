require 'pry'
hearts = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11}
spades = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11}
clubs = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11}
diamonds = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11}

#[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']

deck = [hearts, spades, diamonds, clubs]

player_hand = {}
player_score = 0
computer_hand = {}
computer_score = 0

def draw_card(deck, x=1)
  Hash[deck.sample.to_a.sample(x)]
end

def first_turn(player_hand, computer_hand, draw_card, deck)
  player_hand.merge!(draw_card(deck, 2))
  computer_hand.merge!(draw_card(deck, 2))
  puts "you have #{player_hand.keys.join(' and ')}"
  puts "the computer has #{computer_hand.keys.join(' and ')}"
end

def hit(hand, draw_card, deck)
  hand.merge!(draw_card(deck, 1))
  puts "you have #{hand.keys.join(' and ')}"
end

def score(player_hand, player_score, computer_score, computer_hand)
  player_hand.each {|k, v| player_score += v}
  player_score -= 10 if player_score > 21 && player_hand.has_key?("ace")
  computer_hand.each {|k, v| computer_score += v}
  computer_score -= 10 if computer_score > 21 && computer_hand.has_key?("ace")
    puts "You have #{player_score}"
    puts "The computer has #{computer_score}"
end

def computer_turn(computer_score, computer_hand, deck, draw_card)
  if computer_score < 17
    loop do
      hit(computer_hand, draw_card(deck), deck)
      score(player_hand, player_score, computer_score, computer_hand)
      break if computer_score >= 17
    end
  end  
end

def busted?(score)
  score > 21
end


first_turn(player_hand, computer_hand, draw_card(deck), deck)
score(player_hand, player_score, computer_score, computer_hand)
answer = nil
binding.pry

loop do
  score(player_hand, player_score, computer_score, computer_hand)
  puts "hit or stay?"
  answer = gets.chomp
  break if busted?(player_score)
  hit(player_hand, draw_card(deck), deck)
end

if busted?(player_score)
  puts "you busted!"
else
  puts "you stayed!"
end



# loop do
#   score(player_hand, player_score, computer_score, computer_hand)
#   if player_score < 21
#     puts "would you like a hit?"
#     answer = gets.chomp
#     if answer.downcase.start_with?('y') && player_score < 21
#       hit(player_hand, draw_card(deck), deck)
#       score(player_hand, player_score, computer_score, computer_hand)
#     else
#       score(player_hand, player_score, computer_score, computer_hand)
#       break
#     end
#   else
#     puts "you busted"
#     break
#   end
# end



  
  computer_turn(computer_score, computer_hand, deck, draw_card(deck))

