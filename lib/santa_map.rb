class SantaMap
  attr_reader :position, :houses

  def initialize
    @position = Position.new
    @houses = []
    @houses.push(@position)
  end

  def move(dir)
    if dir == '^'
      @position = Position.new([@position.x, @position.y+1])
    elsif dir == '>'
      @position = Position.new([@position.x+1, @position.y])
    elsif dir == '<'
      @position = Position.new([@position.x-1, @position.y])
    elsif dir == 'v'
      @position = Position.new([@position.x, @position.y-1])
    end

    @houses.push(@position.clone) if search_houses(@position.x, @position.y).empty? 
  end

  def search_houses(x, y)
    @houses.select{|h| h.x == x && h.y == y}
  end
end

class Position
  attr_reader :x, :y

  def hash
    [@x, @y].hash
  end

  def initialize(coord=[])
    if coord==[]
      @x = 0
      @y = 0
    else
      @x = coord[0]
      @y = coord[1]
    end
  end

  def eql?(other_object)
    @x == other_object.x && @y == other_object.y
  end

end
