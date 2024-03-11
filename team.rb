class Team
  attr_accessor :name, :wins, :losses

  def initialize(name)
    @name = name
    @wins = 0
    @losses = 0
  end

  def record
    "#{@wins} - #{@losses}"
  end
end
