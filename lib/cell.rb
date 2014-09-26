class Cell

  VALUE_RANGE = (1..9)

  attr_accessor :value, :candidates, :neighbours

  def initialize
    @value = 0
    @candidates = VALUE_RANGE.to_a
    @neighbours = []
  end

end