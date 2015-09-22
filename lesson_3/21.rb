require 'pry'
hearts = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11 }
spades = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11 }
clubs = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11 }
diamonds = { 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11 }

deck = [hearts, spades, diamonds, clubs]

def draw_card(deck, x=1)
  Hash[deck.sample.to_a.sample(x)]
end

def first_turn(player_hand, computer_hand, deck)
  player_hand.merge!(draw_card(deck, 2))
  computer_hand.merge!(draw_card(deck, 2))
  puts "you have #{player_hand.keys.join(' and ')}"
  puts "the computer has #{computer_hand.keys.join(' and ')}"
end

def hit(hand, deck)
  hand.merge!(draw_card(deck, 1))
  puts "Drew a #{hand.keys.last}"
end

def prelim_score(player_hand)
  player_hand.values.inject(:+)
end

def score(player_hand)
  if prelim_score(player_hand) > 21 && player_hand.has_key?("ace")
    prelim_score(player_hand) - 10
  else
    prelim_score(player_hand)
  end
end

def computer_turn(computer_hand, deck)
  if score(computer_hand) < 17
    loop do
      hit(computer_hand, deck)
      score(computer_hand)
      puts "the computer has #{computer_hand.keys.join(' and ')}"
      break if score(computer_hand) >= 17
    end
  end
end

def busted?(score)
  score > 21
end

def player_win?(player_hand, computer_hand)
  score(player_hand) > score(computer_hand)
end

def tie?(player_hand, computer_hand)
  score(player_hand) == score(computer_hand)
end

def computer_win?(player_hand, computer_hand)
  score(player_hand) < score(computer_hand)
end

loop do
  player_hand = {}
  computer_hand = {}

  first_turn(player_hand, computer_hand, deck)
  puts "you have #{score(player_hand)} and the computer is showing a #{computer_hand.keys[0]}"

  loop do
    loop do
      break if busted?(score(player_hand))
      puts "hit or stay?"
      answer = gets.chomp
      break if answer == "stay"
      hit(player_hand, deck)
      puts "you now have #{score(player_hand)}"
    end

    if !busted?(score(player_hand))
      computer_turn(computer_hand, deck)
      puts "you have #{score(player_hand)} and the computer has #{score(computer_hand)}"
    else
      puts "you busted!"
      break
    end

    if player_win?(player_hand, computer_hand)
      puts "you won!"
      break
    elsif tie?(player_hand, computer_hand)
      puts "tie!"
      break
    elsif computer_win?(player_hand, computer_hand) && score(computer_hand) < 22
      puts "you lost!"
      break
    elsif score(computer_hand) > 21
      puts "computer busted! I guess you won..."
      break
    end
  end
  puts "do you want to play again?"
  again = gets.chomp.downcase
  break if again.start_with?('n')
end

#
#     break
#   else hit?
#   end
#   if bust?(player_hand)
#     break
#   end
# end
#
# computer turn
# if bust?
#   break
#
#
# bust > game over
# hit again?
#
#
#
#
#   if busted?(score(player_hand))
#     puts "you busted!"
#     break
#   else
#     puts "you stayed!"
#   end
#
#   computer_turn(computer_hand, deck, draw_card(deck))
#   puts "you have #{score(player_hand)} and the computer has #{score(computer_hand)}"
#
#   if player_win?(player_hand, computer_hand)
#     puts "you won!"
#   elsif tie?(player_hand, computer_hand)
#     puts "tie!"
#   else
#     puts "you lost!"
#   end
#   puts "would you like to play again?"
#   again = gets.chomp.downcase
#   break if again.start_with?('n')
# end
#
#
#
#
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
#
#
#
#
#
#
