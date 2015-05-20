class Player
  RULES = {
    rock: {
      rock: :draw,
      paper: :lose,
      scissors: :win
    },
    paper: {
      rock: :win,
      paper: :draw,
      scissors: :lose
    },
    scissors: {
      rock: :lose,
      paper: :win,
      scissors: :draw
    }
  }

  attr_reader :choice

  def choose val
    @choice = val.downcase.to_sym
  end

  def vs other
    fail 'Invalid choice' unless RULES[@choice]
    RULES[@choice][other.choice]
  end
end