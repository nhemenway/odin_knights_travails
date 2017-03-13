# class Cell
#   attr_accessor :row, :column
#   def initialize row, column
#     @row = row
#     @column = column
#   end
#   def to_a
#     [@row, @column]
#   end
# end

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

  def on_board?(row, column)
    row.between?(0,7) && column.between?(0,7) ? true : false
  end

  def display 
    @cells.each_slice(8).to_a.each do |row|
      print row
      puts
    end
  end

end



class Knight
end

# c =  Cell.new(1,1)
# p c.to_a
b = Board.new
b.display
p b.on_board?(0,8)