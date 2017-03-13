class Move
  attr_reader :position, :parent

  def initialize(position, parent = nil)
    @position = position
    @parent = parent
  end
end


class Knight
  def initialize
  end

  def available_moves(ary)
    r, c = ary[0], ary[1]
    legal_moves = []
    all_moves = [[r + 1, c + 2], [r + 1, c - 2],
                 [r - 1, c + 2], [r - 1, c - 2],
                 [r + 2, c + 1], [r + 2, c - 1],
                 [r - 2, c + 1], [r - 2, c - 1]] 
    all_moves.each { |move| legal_moves << move if on_board?(move) }
    legal_moves
  end

  def on_board?(ary)
    (0...8).include?(ary[0]) && (0...8).include?(ary[1]) ? true : false
  end

  def knight_moves(start_cell, end_cell)
    return p "not valid" unless on_board?(start_cell) && on_board?(end_cell)

    current_cell = Move.new(start_cell)
    queue = [current_cell]

    until current_cell.position == end_cell do
      current_cell = queue.shift
      available_moves(current_cell.position).each { |move| queue << Move.new(move, current_cell) }
    end

    current_cell    

    moves = [start_cell]
    count = 0
    until current_cell.parent.nil?
      moves << current_cell.position
      count += 1
      current_cell = current_cell.parent
    end

    show_moves(moves.reverse, count)
  end

  def show_moves(moves, count)
    puts "You made it in #{count} moves!"
    p moves.each { |move| move}
  end


end

k = Knight.new()
k.knight_moves([0,0],[1,1])
k.knight_moves([0,0],[0,0])
k.knight_moves([0,0],[0,9])
