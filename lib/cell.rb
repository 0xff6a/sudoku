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

  def unsolved?
    !solved?
  end

  def solve!
    return if solved?
    @value = candidates.first if solvable?
  end

  private

  def solvable?
    candidates.count == 1
  end

end