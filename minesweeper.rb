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
  attr_accessor :grid

  def initialize(size = 3)
    @grid = Array.new(size) {Array.new(size)}
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
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
    (0...grid.length).to_a.shuffle.each do |x|
      (0...grid.length).to_a.shuffle.each do |y|
        grid[x,y] = tiles[tile_number]
        tile_number += 1
      end
    end

  end

  def display
    @grid
  end

end
