require_relative 'team'
require_relative 'match'

class BasketballTournament
  def initialize
    @teams = []
  end

  def run
    puts "Welcome to the Basketball Tournament Manager!"
    loop do
      puts "What would you like to do?"
      puts "1. Add a team"
      puts "2. View teams"
      puts "3. Simulate a match"
      puts "4. Exit"
      print "> "
      choice = gets.chomp.to_i

      case choice
      when 1
        add_team
      when 2
        view_teams
      when 3
        simulate_match
      when 4
        exit
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  def add_team
    puts "Enter team name:"
    name = gets.chomp
    team = Team.new(name)
    @teams << team
    puts "Team added successfully!"
  end

  def view_teams
    if @teams.empty?
      puts "No teams added yet."
    else
      puts "Listing all participating teams:"
      @teams.each do |team|
        puts "#{team.name} - Record: #{team.record}"
      end
    end
  end

  def simulate_match
    if @teams.size < 2
      puts "Not enough teams to simulate a match."
    else
      puts "Select two teams to simulate a match:"
      @teams.each_with_index { |team, index| puts "#{index + 1}. #{team.name}" }
      print "Team A: "
      teamA_index = gets.chomp.to_i - 1
      print "Team B: "
      teamB_index = gets.chomp.to_i - 1

      if teamA_index >= 0 && teamA_index < @teams.size && teamB_index >= 0 && teamB_index < @teams.size && teamA_index != teamB_index
        match = Match.new(@teams[teamA_index], @teams[teamB_index])
        puts match.simulate_result
      else
        puts "Invalid team selection. Please try again."
      end
    end
  end
end

# Run the CLI application
tournament = BasketballTournament.new
tournament.run if __FILE__ == $PROGRAM_NAME
