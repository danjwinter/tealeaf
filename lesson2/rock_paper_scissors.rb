VALID_CHOICES = %w(rock paper scissors lizard spock)
player_win = 0
computer_win = 0


def prompt(message)
  Kernel.puts("=> #{message}")
end

def down_start(word, letter)
  word.downcase.start_with?(letter)
end

def win?(first, second)
  down_start(first, 'r') && down_start(second, 'sc') || down_start(second, 'l') ||
  down_start(first, 'p') && down_start(second, 'r') || down_start(second, 'sp') ||
  down_start(first, 'sc') && down_start(second, 'p') || down_start(second, 'l') ||
  down_start(first, 'l') && down_start(second, 'p') || down_start(second, 'sp') ||
  down_start(first, 'sp') && down_start(second, 'r') || down_start(second, 'sc')
  
end

def display_results(choice, computer_choice)
  if win?(choice, computer_choice)
    prompt("You won!")
  elsif win?(computer_choice, choice)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: rock, paper, scissors, spock, lizzard")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.each {|word| word.start_with?(choice)} && choice.downcase != 's'
      break
    else
      prompt("That's not a valid choice. Please choose #{VALID_CHOICES.join(', ')}")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}, Computer chose #{computer_choice}")

  display_results(choice, computer_choice)
  
 
  if win?(choice, computer_choice)
    player_win += 1
  elsif
    win?(computer_choice, choice)
    computer_win += 1
  else
    nil
  end
  
  prompt("You have #{player_win} wins and the computer has #{computer_win} victories! Play to 5!")

  if computer_win == 5 || player_win == 5
    break
  end
end

prompt "Thanks for playing!"
