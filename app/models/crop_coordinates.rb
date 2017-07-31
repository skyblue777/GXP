class CropCoordinates
  attr_reader :x, :y, :w, :h

  def initialize(x = nil, y = nil, w = nil, h = nil)
    @x = x
    @y = y
    @w = w
    @h = h
  end

  def present?
    [x, y, w, h].none? &:blank?
  end

  def to_a
    [x, y, w, h]
  end

end
