def game()

  $player_one = {
    :name => "",
    :x_or_o => "",
    :plays => [],
    :current => false 
  }

  $player_two = {
    :name => "",
    :x_or_o => "",
    :plays => [],
    :current => true
  }

  #Intro
  puts "Are you ready to BATTLE!?!? "
  sleep(1)
  puts "Player One, Enter your name!"
  $player_one[:name] = gets.chomp
  puts "Yo #{$player_one[:name]}! Are you going to be X or O for this fight?"
  $selection = gets.chomp.upcase()

  #assign each player 
    case $selection
      when "X"
        $player_one[:x_or_o] = "X"
        $player_two[:x_or_o] = "O"
      when "O"
        $player_one[:x_or_o] = "O"   
        $player_two[:x_or_o] = "X"
      end    

  puts "So, you\'ve chosen #{$selection}..."
  sleep(1)
  puts "Player Two, Enter your name!"
  $player_two[:name] = gets.chomp
  
end  

class Board

attr_accessor :one, :two, :three, :four, :five, :six, :seven, :eight, :nine, :line1, :line2, :line3, :break 

  def initialize()
    @one = 1
    @two = 2
    @three = 3
    @four = 4
    @five = 5
    @six = 6
    @seven = 7
    @eight = 8
    @nine = 9

    def print_board()
      puts ""
      puts "  #{@one}  |  #{@two}  |  #{@three} "
      puts "-----+-----+-----"
      puts "  #{@four}  |  #{@five}  |  #{@six} "
      puts "-----+-----+-----"
      puts "  #{@seven}  |  #{@eight}  |  #{@nine} "
      puts ""
    end  
  end
end

def start_board()
  $game_board = Board.new()
  $game_board.print_board()
end  

def update_board()
  $game_board.print_board()
end  
  
def make_play()
  if $player_one[:current] == true
    $current_player = $player_one
  else
    $current_player = $player_two  
  end  

  #switch current player
  def player_switch()
    if $player_one[:current] == true
      $player_one[:current] = false
      $player_two[:current] = true
    else
      $player_one[:current] = true
      $player_two[:current] = false  
    end
  end

  def check_if_occupied(num, current_player)
    if $player_one[:plays].include?(num) || $player_two[:plays].include?(num)
      puts "That space is taken! Pick another!" 
      make_play()
    end
  end  
 
  puts $current_player[:name] + ", Which space do you want to mark?"
  player_choice = gets.chomp  

  # take player entry and update board object
  case player_choice.to_i() 
    when 1
      check_if_occupied(1, $current_player)
      $game_board.one = $current_player[:x_or_o].upcase 
      $current_player[:plays].push(1)
    when 2
      check_if_occupied(2, $current_player)
      $game_board.two = $current_player[:x_or_o].upcase 
      $current_player[:plays].push(2)
    when 3
      check_if_occupied(3, $current_player)
      $game_board.three = $current_player[:x_or_o].upcase 
      $current_player[:plays].push(3)
    when 4
      check_if_occupied(4, $current_player)
      $game_board.four = $current_player[:x_or_o].upcase
      $current_player[:plays].push(4)
    when 5
      check_if_occupied(5, $current_player)
      $game_board.five = $current_player[:x_or_o].upcase 
      $current_player[:plays].push(5)
    when 6
      check_if_occupied(6, $current_player)
      $game_board.six = $current_player[:x_or_o].upcase
      $current_player[:plays].push(6) 
    when 7
      check_if_occupied(7, $current_player)
      $game_board.seven = $current_player[:x_or_o].upcase
      $current_player[:plays].push(7) 
    when 8
      check_if_occupied(8, $current_player)
      $game_board.eight = $current_player[:x_or_o].upcase 
      $current_player[:plays].push(8) 
    when 9
      check_if_occupied(9, $current_player)
      $game_board.nine = $current_player[:x_or_o].upcase 
      $current_player[:plays].push(9)    
  end 

  def check_win() 
    #win variation - 1, 2, 3
    if ($game_board.one == $game_board.two) && ($game_board.two == $game_board.three)
      puts "Congratulations, " + $current_player[:name] + " is the winner!"
      return true
    end  

    #win variation - 1, 5, 9
    if ($game_board.one == $game_board.five) && ($game_board.five == $game_board.nine)
      puts "Nice move, " + $current_player[:name] + " is the winner!"
      return true
    end  

    #win variation - 1, 4, 7 
    if ($game_board.one == $game_board.four) && ($game_board.four == $game_board.seven)
      puts "Well done, " + $current_player[:name] + " is the winner!"
      return true
    end  

    #win variation - 2, 5, 8
    if ($game_board.two == $game_board.five) && ($game_board.five == $game_board.eight)
      puts "Congratulations, " + $current_player[:name] + " is the winner!"
      return true
    end  

    #win variation - 3, 6, 9
    if ($game_board.three == $game_board.six) && ($game_board.six == $game_board.nine)
      puts "Nice move, " + $current_player[:name] + " is the winner!"
      return true
    end  

    #win variation - 3, 5, 7
    if ($game_board.three == $game_board.five) && ($game_board.five == $game_board.seven)
      puts "Well done, " + $current_player[:name] + " is the winner!"
      return true  
    end  

    #win variation - 4, 5, 6
    if ($game_board.four == $game_board.five) && ($game_board.five == $game_board.six)
      puts "Congratulations, " + $current_player[:name] + " is the winner!"
      return true
    end  

      #win variation - 7, 8, 9
    if ($game_board.seven == $game_board.eight) && ($game_board.eight   == $game_board.nine)
      puts "Nice move, " + $current_player[:name] + " is the winner!"
      return true
    end  

  end  

  #board full - no winner
  def check_deadlock()
    if ($player_one[:plays].length() + $player_two[:plays].length()) >= 9 && !check_win()
      puts "It\'s a draw! Better luck next time!"
      return true
    end  
  end  

  player_switch()
  update_board()

  if !check_win() && !check_deadlock()
    make_play()
  else
    sleep(5)
    system('clear')
    game()
    start_board()
    make_play()
  end    

end 

game()
start_board()
make_play()