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
  }

  def self.moves
    RULES.keys
  end

  def result player1, player2
    player1.vs player2
  end

  # def result player1, player2
  #   if (player1.choice == :rock && player2.choice == :scissors) ||
  #     (player1.choice == :paper && player2.choice == :rock) ||
  #     (player1.choice == :scissors && player2.choice == :paper)
  #     "Player 1 wins!"
  #   elsif player1.choice == player2.choice
  #     "It's a draw!"
  #   else
  #     "Player 1 loses!"
  #   end
  # end

  # def result player1, player2
  #   if player1.choice == player2.choice
  #     "It's a draw!"
  #   elsif player1.choice == :rock
  #     if player2.choice == :scissors
  #       "Player 1 wins!"
  #     else
  #       "Player 1 loses!"
  #     end
  #   elsif player1.choice == :rock
  #     if player2.choice == :scissors
  #       "Player 1 wins!"
  #     else
  #       "Player 1 loses!"
  #     end
  #   elsif player1.choice == :rock
  #     if player2.choice == :scissors
  #       "Player 1 wins!"
  #     else
  #       "Player 1 loses!"
  #     end
  #   end
  # end
end