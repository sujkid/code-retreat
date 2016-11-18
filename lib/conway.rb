# code retreat!
class Game
  def initialize
    @board = [
      [nil, nil, 1, 1, 1],
      [nil, 1, 1, 1, nil],
      [1, nil, nil, 1, 1],
      [1, 1, 1, nil, nil],
      [nil, 1, nil, nil, 1]
    ]
    @space_checks = [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ]
    @new_board = [
      [nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil],
    ]
  end

  def check_one_space(y, x)
    if @board[y][x] && (y >= 0 && x >= 0)
      true
    else
      false
    end
  end

  def eval_space(y, x)
    neighbors = 0
    @space_checks.each do |e|
      if check_one_space(y + e[0], x + e[1]) == true
        neighbors += 1
      end
    end
    neighbors
  end

  def alive_or_dead(y, x)
    neighbors = eval_space(y, x)
     if @board[y][x] == 1 && (neighbors == 2 || neighbors == 3)
       @new_board[y][x] = 1
     elsif @board[y][x] == 1 && (neighbors < 2 || neighbors > 3)
       @new_board[y][x] = nil
     elsif @board[y][x] == 0 && neighbors == 3
    end
  end
end
