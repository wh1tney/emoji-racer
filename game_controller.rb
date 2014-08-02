# coding: utf-8
require_relative './game_utils'

module Interface
  def self.output_with_newline msg
    puts msg
  end

  def self.output_without_newline msg
    print msg
  end
end

class Position
  def initialize(handicap = 5)
    @handicap = handicap
  end

 def advance
    rand(1..@handicap)
  end
end

class Game
  attr_reader :players, :length

  def initialize(players, length = 120)
    @players = Hash[players.zip(Array.new(players.length) {0})]
    @length = length
  end

  def update_board
    players.each do |player, position|
      Interface.output_without_newline "➖" * length
      Interface.output_without_newline "🚩\n\n"
      lay_track(player, position)
    end
    Interface.output_without_newline "➖" * length
    Interface.output_without_newline "🚩\n"
  end

  def lay_track(player, position)
    (length).times.with_index do |index|
      break if index >= length
      filling = position == index ? player : " "
      Interface.output_without_newline filling
    end
    Interface.output_with_newline "\n"
  end

  def finished?
    self.winner
  end

  def winner
    winner = players.select {|player, pos| pos >= length-player.length}
    if winner.empty?
      nil
    else
      players[winner.keys[0]] = length - winner.keys[0].length
      winner.keys[0]
    end
  end

  def advance_player!(player_id)
    position = Position.new
    players[player_id] += position.advance
  end
end
