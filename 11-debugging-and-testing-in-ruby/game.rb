require 'pry'
require_relative 'player'
class Game
  attr_reader :width, :height
  attr_accessor :players

  def initialize(number_of_players)
    @width = 10
    @height = 20
    @players = []

    number_of_players.times do
      x = (0..@width).to_a.sample
      y = (0..@height).to_a.sample
      @players << Player.new(x, y)
    end
  end

  def self.start
    puts "It's Adventure Time!"
    print "How many people are adventuring? "
    number_of_players = gets.chomp.to_i

    game = new(number_of_players)
    game.turn
  end

  def turn
    moves = [1, -1]

    @players.each do |player|
      puts "Player #{player.id} moved!"
      new_x = moves.sample
      new_y = moves.sample

      if new_x >= 0 && new_x < width
        player.x += new_x
      end

      if new_y >= 0 && new_y < height
        player.y += new_y
      end
    end
  end

end

Game.start
