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
    update_candidates
    set_value if solvable?
  end

  private

  def solvable?
    candidates.count == 1
  end

  def update_candidates
    @candidates -= neighbours.map(&:value).uniq
  end

  def set_value
    @value = candidates.first
  end

end