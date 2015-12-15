class Present
  attr_reader :smallest_side_area, :smallest_perimeter, :bow_size

  def initialize(l, w, h)
    @length = l
    @width = w
    @height = h

    temp = [l, w, h]
    temp.sort!
    @smallest_side_area = temp[0] * temp[1]
    @smallest_perimeter = temp[0]*2 + temp[1]*2
    @bow_size = l*w*h
  end

  def surface_area
    2 * @length * @width + 2 * @length * @height + 2 * @width * @height
  end

  def total_paper
    surface_area + @smallest_side_area
  end

end
