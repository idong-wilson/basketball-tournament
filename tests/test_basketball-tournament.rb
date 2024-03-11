require 'minitest/autorun'
require_relative '../basketball-tournament'

class BasketballTournamentTest < Minitest::Test
  def setup
    @tournament = BasketballTournament.new
  end

  def test_add_team
    @tournament.add_team
    assert_equal 1, @tournament.instance_variable_get(:@teams).size
  end

  def test_view_teams
    @tournament.instance_variable_get(:@teams) << Team.new("Team A")
    assert_output(/Team A - Record: 0 - 0/) { @tournament.view_teams }
  end

  def test_simulate_match
    @tournament.instance_variable_get(:@teams) << Team.new("Team A")
    @tournament.instance_variable_get(:@teams) << Team.new("Team B")
    assert_output(/wins against/) { @tournament.simulate_match }
  end

  def test_invalid_simulate_match
    @tournament.instance_variable_get(:@teams) << Team.new("Team A")
    assert_output(/Invalid team selection/) { @tournament.simulate_match }
  end
end
