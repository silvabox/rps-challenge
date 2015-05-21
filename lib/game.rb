class Game
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
  }.freeze
  
  def self.moves
    RULES.keys
  end
end