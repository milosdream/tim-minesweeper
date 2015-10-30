class Game
  def start
  end

  def won
  end
end

class Tile
  def reveal
  end

  def neighbors
  end

  def neighbor_bomb_count
  end
end

#hello
class Board
  attr_reader :grid

  def initialize(size = 3)
    @grid = Array.new(size) {Array.new(size)}
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end



  def put_bombs(size)
  end
end
