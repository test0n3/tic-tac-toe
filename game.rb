
# puts "### Welcome to Tic tac toe ###"
# puts "-> Your turn"

@winners = [
  Regex.new(/^u...u...u$/),
  Regex.new(/^..u.u.u..$/),  
  Regex.new(/^u..u..u..$/),  
  Regex.new(/^.u..u..u.$/),  
  Regex.new(/^..u..u..u$/),  
  Regex.new(/^uuu......$/),  
  Regex.new(/^...uuu...$/),  
  Regex.new(/^......uuu$/),
  Regex.new(/^c...c...c$/),
  Regex.new(/^..c.c.c..$/),  
  Regex.new(/^c..c..c..$/),  
  Regex.new(/^.c..c..c.$/),  
  Regex.new(/^..c..c..c$/),  
  Regex.new(/^ccc......$/),  
  Regex.new(/^...ccc...$/),  
  Regex.new(/^......ccc$/),  
]

# !!("phoneasds" =~ /^.h...$/)
@row = 0
@column = 0
@current_game = [[],[],[]]
@turn = ""

def get_move_user
  puts "Qué fila quieres?"
  @row = gets.to_i
  puts "Qué columna quieres?"
  @column = gets.to_i
  @turn = "u"
end

def show_current_game
  puts current_game.to_s
end

def update_game(turn)
  @current_game[@row][@column] = turn
end


# !!("phoneasds" =~ /^.h...$/)
def compare_with_winners()
  @winners.any? do |play_win|
    
  end
end

def game
  get_move_user
  update_game
  show_current_game
  compare_with_winners
  # machine_turn
  # show_current_game
  # compare_with_winners
end

game
