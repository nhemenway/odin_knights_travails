class Board
  attr_accessor :cells

  def initialize
    @cells = []
    make_board
  end

  def make_board
    (0...8).each do |row|
      (0...8).each do |column|
        @cells << [row, column]
      end
    end
  end

  def on_board?(ary)
    (0...8).include?(ary[0]) && (0...8).include?(ary[1]) ? true : false
  end

  # for testing board
  def display 
    @cells.each_slice(8).to_a.each do |row|
      print row
      puts
    end
  end
end

class Move
  attr_reader :position, :parent

  def initialize(position, parent = nil)
    @position = position
    @parent = parent
  end
end


class Knight
  attr_accessor :position

  def initialize(position = [0,0], board = Board.new())
    @board = board
  end

  def available_moves(ary)
    r, c = ary[0], ary[1]
    legal_moves = []
    all_moves = [[r + 1, c + 2], [r + 1, c - 2],
                 [r - 1, c + 2], [r - 1, c - 2],
                 [r + 2, c + 1], [r + 2, c - 1],
                 [r - 2, c + 1], [r - 2, c - 1]] 
    all_moves.each { |move| legal_moves << move if @board.on_board?(move) }
    legal_moves
  end

  def knight_moves(start_cell, end_cell)
    current_cell = Move.new(start_cell)
    queue = [current_cell] 

    until current_cell.position == end_cell do
      current_cell = queue.shift
      available_moves(current_cell.position).each { |move| queue << Move.new(move, current_cell) }
    end

    current_cell    

    moves = []
    count = 0
    until current_cell.nil?
      moves << current_cell.position
      current_cell = current_cell.parent
    end

    moves.reverse!
  end


 # def breadth_first_search(value)
 #    queue = [@root]

 #    until queue.empty?
 #      node = queue.shift
 #      return node if value == node.value
 #      queue << node.left unless node.left.nil?
 #      queue << node.right unless node.right.nil?
 #    end
 #    return nil
 #  end





end

# c =  Cell.new(1,1)
# p c.to_a
# b = Board.new
# p b.on_board?([-2, 1])

k = Knight.new()
# p k.available_moves([1,0])

p k.knight_moves([0,0],[1,1])

