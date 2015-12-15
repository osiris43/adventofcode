class Elevator
  attr_reader :basement_char

  def initialize 
    @basement_char = 0
  end

  def move(inst)
    floor = 0
    inst.each_char.with_index do |c,idx|
      if c == '('
        floor = floor + 1
      elsif c == ')'
        floor = floor - 1
      else
        'puts bad instruction set'
      end

      if floor < 0 and @basement_char == 0
        @basement_char = idx + 1
      end
    end

    floor
  end
end
