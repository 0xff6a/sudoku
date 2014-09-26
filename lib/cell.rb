class Cell

  VALUE_RANGE = (1..9)

  attr_accessor :value, :candidates, :neighbours

  def initialize(value = 0)
    @value = value
    @candidates = VALUE_RANGE.to_a
    @neighbours = []
  end

  def solved?
    VALUE_RANGE.include?(value)
  end

  def solve!
    @value = candidates.first if lone_candidate?
  end

  private

  def lone_candidate?
    candidates.count == 1
  end

end