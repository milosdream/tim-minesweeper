require 'byebug'

class Game
  def start
  end

  def won
  end
end

class Tile

  def initialize(bomb = false)
    @bomb = bomb
  end

  def reveal
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

  def [](x,y)
    @grid[x][y]
  end

  def []=(x, y, value)
    @grid[x][y] = value
  end

  def put_bombs
    spots = grid.length ** 2
    tiles = []
    (0...spots).to_a.each do |spot|
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
        grid.[]=(x,y,tiles[tile_number])
        tile_number += 1
      end
    end

    nil
  end

  # def fill_in
  #   tile_number = 0
  #   row = (0...grid.length).to_a.shuffle!
  #   col = (0...grid.length).to_a.shuffle!
  #   row.each do |x|
  #     col.each do |y|
  #       grid[x][y] = tile_number
  #       tile_number += 1
  #     end
  #   end
  #   @grid
  # end


  def display
    @grid
  end

end
