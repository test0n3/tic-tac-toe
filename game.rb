
# puts "### Welcome to Tic tac toe ###"
# puts "-> Your turn"

@winners = [
  Regexp.new(/^u...u...u$/),
  Regexp.new(/^..u.u.u..$/),
  Regexp.new(/^u..u..u..$/),
  Regexp.new(/^.u..u..u.$/),
  Regexp.new(/^..u..u..u$/),
  Regexp.new(/^uuu......$/),
  Regexp.new(/^...uuu...$/),
  Regexp.new(/^......uuu$/),
  Regexp.new(/^c...c...c$/),
  Regexp.new(/^..c.c.c..$/),
  Regexp.new(/^c..c..c..$/),
  Regexp.new(/^.c..c..c.$/),
  Regexp.new(/^..c..c..c$/),
  Regexp.new(/^ccc......$/),
  Regexp.new(/^...ccc...$/),
  Regexp.new(/^......ccc$/)
]

# !!("phoneasds" =~ /^.h...$/)
@row = 0
@column = 0
@current_game = [["-","-","-"],["-","-","-"],["-","-","-"]]
@turn = ""

def get_move_user
  puts "Qué fila quieres?"
  @row = gets.to_i
  puts "Qué columna quieres?"
  @column = gets.to_i
  puts "Jugada User: #{@row}, #{@column}"
  @turn = "u"
  valid_move
end

def show_current_game
  puts @current_game.to_s
end

def update_game()
  @current_game[@row][@column] = @turn
end

# !!("phoneasds" =~ /^.h...$/)
def compare_with_winners()
  winner = @winners.any? do |play_win|
    @current_game.join("") =~ play_win  
  end
  if winner
    puts "GAME OVER: WIN #{@turn}"
  end
  winner
end

def machine_turn
  @turn = "c"
  @row = Random.rand(0...3)
  @column = Random.rand(0...3)
  puts "Jugada PC: #{@row}, #{@column}"
  valid_move
end

def valid_move
  if @current_game[@row][@column] === "-"
    update_game
  else
    get_move_user if @turn === "u"
    machine_turn if @turn === "c"
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
