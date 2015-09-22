require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[2, 5, 8], [1, 4, 7], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, MetricsABCsize
def display_board(brd)
  system 'clear'
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, MetricsABCsize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd), ', ')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, try again."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      square = brd.value(line)[' ']
    else
  square = empty_squares(brd).sample
    end
  brd[square] = COMPUTER_MARKER
  end
end

def joinor(arr, delimiter, word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # if brd[line[0]] == PLAYER_MARKER &&
 #       brd[line[1]] == PLAYER_MARKER &&
 #       brd[line[2]] == PLAYER_MARKER
 #      return 'Player'
 #    elsif brd[line[0]] == COMPUTER_MARKER &&
 #          brd[line[1]] == COMPUTER_MARKER &&
 #          brd[line[2]] == COMPUTER_MARKER
 #      return 'Computer'
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

player_win = 0
computer_win = 0
loop do
  board = initialize_board
  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  
  if detect_winner(board) == 'Player'
    player_win += 1
  elsif detect_winner(board) == 'Computer'
    computer_win += 1
  end
  
  if someone_won?(board)
    prompt "#{detect_winner(board)} won! The score is Player: #{player_win} and Computer #{computer_win}"
  else
    prompt "It's a tie! The score is Player: #{player_win} and Computer #{computer_win}"
  end
  
  prompt "You have #{player_win} wins and the computer has #{computer_win} wins."
  prompt "Would you like to play to 5?"
  answer = gets.chomp

  break if computer_win == 5 || player_win == 5
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing."
