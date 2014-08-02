require_relative 'game_controller'

#---GAMEPLAY---
players = ['Player 1 😁', 'Player 2 😌', 'Player 3 😎', 'Player 4 👨', 'Player 5 🌸']
game = Game.new(players)
clear_screen!

until game.finished?
  players.each do |player_id|
  move_to_home!

  game.advance_player!(player_id) unless game.finished?
  game.update_board

  sleep(0.08)
  end
sleep(0.01)
end

Interface.output_with_newline "\n#{game.winner[0..-3]} is bawse.\n"
