class Match
  attr_reader :teamA, :teamB

  def initialize(teamA, teamB)
    @teamA = teamA
    @teamB = teamB
  end

  def simulate_result
    winner = rand(2) == 0 ? @teamA : @teamB
    loser = winner == @teamA ? @teamB : @teamA
    winner.wins += 1
    loser.losses += 1
    "#{winner.name} wins against #{loser.name}!"
  end
end
