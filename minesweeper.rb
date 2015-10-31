require 'byebug'

class Game
  def start
  end

  def won
  end
end

class Tile
  #if tile has bomb, then it wont have anything else
  #if tile doesnt have bomb, then it will have # or _
  #all tiles start out will have *
  attr_accessor :face
  def initialize(bomb = false)
    @face = "*"
    @bomb = bomb
  end


  def reveal
    #
  end

  def neighbors
  end

  def neighbor_bomb_count
  end
end

class Board
  attr_reader :grid

  def initialize(size = 3)
    @grid = Array.new(size) {Array.new(size)}
  end

  def put_bombs
    spots = grid.length ** 2
    tiles = []
    (1..spots).to_a.each do |spot|
      if (spot + 0.0)/spots < 0.334
        tiles << Tile.new(true)
      else
        tiles << Tile.new
      end
    end

    tile_number = 0
    row = (0...grid.length).to_a.shuffle!
    col = (0...grid.length).to_a.shuffle!
    row.each do |x|
      col.each do |y|
        grid[x][y] = tiles[tile_number]
        tile_number += 1
      end
    end

    nil
  end


  def display
    header = (0...grid[0].length).to_a.join("  |  ")
    puts "      #{header}"
    puts "   #{"------" * grid[0].length}"

    (0...grid.length).to_a.each do |num|
      puts "#{num}  |  #{grid[num].join("  |  ")}"
      puts "   #{"------" * grid[0].length}"
    end
    nil
  end



end
