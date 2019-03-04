=begin
puts "### Welcome to Tic tac toe ###"
puts "-> Your turn. You are X"

@winners = [
  Regexp.new(/^x...x...x$/),
  Regexp.new(/^..x.x.x..$/),
  Regexp.new(/^x..x..x..$/),
  Regexp.new(/^.x..x..x.$/),
  Regexp.new(/^..x..x..x$/),
  Regexp.new(/^xxx......$/),
  Regexp.new(/^...xxx...$/),
  Regexp.new(/^......xxx$/),
  Regexp.new(/^o...o...o$/),
  Regexp.new(/^..o.o.o..$/),
  Regexp.new(/^o..o..o..$/),
  Regexp.new(/^.o..o..o.$/),
  Regexp.new(/^..o..o..o$/),
  Regexp.new(/^ooo......$/),
  Regexp.new(/^...ooo...$/),
  Regexp.new(/^......ooo$/)
]

@row = 0
@column = 0
@current_game = [["-","-","-"],["-","-","-"],["-","-","-"]]
@turn = ""

def get_move_user
  @turn = "x"
  puts "Qué fila quieres?"
  @row = gets.to_i
  puts "Qué columna quieres?"
  @column = gets.to_i
  valid_move
end

def show_current_game
  (@turn == "x") ? (puts "Move user") : (puts "Move machine") 
  @current_game.each do |row|
    puts row.join(" ")
  end
end

def update_game()
  @current_game[@row][@column] = @turn
end

def compare_with_winners()
  winner = @winners.any? do |play_win|
    @current_game.join("") =~ play_win  
  end
  if winner
    puts "GAME OVER: WIN #{@turn}"
  else
    if @current_game.join("").count("-") == 0
      puts "GAME OVER: TIED MATCH"
      return true
    end
  end
  winner
end

def machine_turn
  @turn = "o"
  @row = Random.rand(0...3)
  @column = Random.rand(0...3)
  #puts "Jugada PC: #{@row}, #{@column}"
  valid_move
end

def valid_move
  if @current_game[@row][@column] === "-"
    update_game
  else
    get_move_user if @turn === "x"
    machine_turn if @turn === "o"
  end

end

def game
  get_move_user
  show_current_game
  return if compare_with_winners
  machine_turn
  show_current_game
  return if compare_with_winners
  game
end

game
=end

def game
  board = [["-", "-", "-"],
           ["-", "-", "-"],
           ["-", "-", "-"]]
  board_pos = {
      1 => [0,0],
      2 => [0,1],
      3 => [0,2],
      4 => [1,0],
      5 => [1,1],
      6 => [1,2],
      7 => [2,0],
      8 => [2,1],
      9 => [2,2]
      }
  loop do
      user_move(board, board_pos)
      show_board(board)
      if winner(board, "X")
          return 
      end
      machine_move(board, board_pos)
      show_board(board)
      if winner(board, "O")
          return
      end
  end
end

def user_move(board, board_pos)
  #puts "Tablero\n#{board}\nHash de posiciones#{board_pos}"
  pos = 0
  loop do
      print "Ingrese posición en tablero 1 - 9: "
      pos = Integer(gets.chomp)
      #puts "Usuario posición solicitada: #{pos}"
      if test_move(board, board_pos, pos)
          break
      end
  end
  puts "Posición elegida por usuario: #{pos}"
  mark_move(board, board_pos, pos, "X")
end

def machine_move(board, board_pos)
  pos = 0
  loop do
      pos = Random.rand(1..6)
      puts "Machine selection: #{pos}"
      if test_move(board, board_pos, pos)
          break
      end
  end
  mark_move(board, board_pos, pos, "O")
  print "Maquina eligió posición: #{pos}"
end

def mark_move(board, board_pos, pos, player)
  pos_x, pos_y = board_pos[pos]
  board[pos_x][pos_y] = player
end

def test_move(board, board_pos, pos)
  pos_x, pos_y = board_pos[pos]
  if board[pos_x][pos_y] != "-"
      return false
  end
  true
end

def show_board(board)
  #system "clear"
  puts "Posiciones"
  puts "1 2 3\n4 5 6\n7 8 9"
  puts "Tablero"
  board.each do |row|
      puts row.join(" ")
  end
end

def winner(board, player)
  winners = [
      Regexp.new(/^X...X...X$/),
      Regexp.new(/^..X.X.X..$/),
      Regexp.new(/^X..X..X..$/),
      Regexp.new(/^.X..X..X.$/),
      Regexp.new(/^..X..X..X$/),
      Regexp.new(/^XXX......$/),
      Regexp.new(/^...XXX...$/),
      Regexp.new(/^......XXX$/),
      Regexp.new(/^O...O...O$/),
      Regexp.new(/^..O.O.O..$/),
      Regexp.new(/^O..O..O..$/),
      Regexp.new(/^.O..O..O.$/),
      Regexp.new(/^..O..O..O$/),
      Regexp.new(/^OOO......$/),
      Regexp.new(/^...OOO...$/),
      Regexp.new(/^......OOO$/)
  ]
  winner = winners.any? do |play|
      board.join("") =~ play
  end
  if winner && player == "X"
      puts "Game Over. User wins!"
  elsif winner && player == "O"
      puts "Game Over. Machine wins!"
  else
      if board.join("").count("-") == 0
          puts "Game Over: Tied Match"
          return true
      end
  end
  false
end

game
