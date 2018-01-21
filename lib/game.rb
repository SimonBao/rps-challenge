#
class Game
  attr_reader :players, :player1, :player2
  def self.create(player1, player2 = Player.new('Computer'))
    @game = Game.new(player1, player2)
  end

  def self.current_game
    @game
  end

  def initialize(player1, player2 = Player.new('Computer'))
    @player1 = player1
    @player2 = player2
    @players = [player1, player2]
  end

  def result
    win_condition
  end

  def win_condition
    p '---------------'
    p player2.weapon
    p '---------------'
    if rules[player1.weapon].include?(player2.weapon)
      return "#{player1} Won!"
    elsif rules[player1.weapon].include?(player2.weapon)
      return "#{player2} Won!"
    elsif player1.weapon == player2.weapon
      return 'You drew!'
     end

  end

  def rules
    rulebook = {
      rock: [:scissors, :lizard],
      paper: [:rock, :spock],
      scissors: [:paper, :lizard],
      spock: [:rock, :scissors],
      lizard: [:spock, :paper]
    }
  end

end
