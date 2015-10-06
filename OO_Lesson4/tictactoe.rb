require 'pry'
class Board
  attr_accessor :squares
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[2, 5, 8], [1, 4, 7], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts '     |     |'
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts '     |     |'
    puts ''
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker 

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = @human_marker

  attr_reader :board, :human, :computer
  attr_accessor :human_marker, :marker

  def initialize
    @board = Board.new
    @human = Player.new(@human_marker)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    @computer_score = 0
    @human_score = 0
    @human_marker = human_marker
  end
  
  def play
    display_welcome_message
    clear
    loop do
      display_board
      player_marker_select
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board
      end
      display_result
      puts "Your score: #{@human_score}. Computer score: #{@computer_score}"
      break unless play_again?
      break if @human_score == 5 || @computer_score == 5
      reset
      display_play_again_message
    end
    display_goodbye_message
  end

  def player_marker_select
    puts "Which marker would you like?"
    @human_marker = gets.chomp
  end


  def current_player_moves
    if @current_marker == COMPUTER_MARKER
      computer_moves
      @current_marker = @human_marker
    else
      human_moves
      @current_marker = COMPUTER_MARKER
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear
    system 'clear'
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end
  
  def joinor (arr, delimiter, word='or')
    arr[-1] = "#{word} #{arr.last}" if arr.size > 1
    arr.join(delimiter)
  end

  def human_moves
    puts "Choose a square (#{joinor(board.unmarked_keys, ', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice"
    end
    board[square] = @human_marker
  end

  def computer_moves
    #board.set_square_at(board.unmarked_keys.sample, computer.marker)
    #board[board.unmarked_keys.sample] = computer.marker
    square = nil
  
    Board::WINNING_LINES.each do |line|
      square = find_at_risk_square(line, board, COMPUTER_MARKER)
      break if square
    end
  
    if !square
      Board::WINNING_LINES.each do |line|
        square = find_at_risk_square(line, board, @player_marker)
        break if square
      end
    end
  
    if !square
      square = 5 if board[5] == INITIAL_MARKER
    end
  
    if !square
      square = board.unmarked_keys.sample
    end

    board[square] = COMPUTER_MARKER
    
  end
  
  def find_at_risk_square(line, board, marker)
    binding.pry
    if board.values_at(*line).count(marker) == 2
      board.select { |k,v| line.include?(k) && v == INITIAL_MARKER }.keys.first
    else
      nil
    end
  end

  def display_result
    display_board
    case board.winning_marker
    when human.marker
      @human_score += 1
      puts "You won!"
    when computer.marker
      @computer_score += 1
      puts "Computer won!"
    else
    puts "It's a tie!"
  end
  end

  def play_again?
    answer = nil
    loop do
     puts "Would you like to play again? (y/n)" 
     answer = gets.chomp.downcase
     break if %w(y n).include? answer
     puts "Sorry, must be y or n"
    end
    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
