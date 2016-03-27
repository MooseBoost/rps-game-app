class RPSGame
  attr_reader :play, :computer_play
  @@valid_plays = [:rock, :paper, :scissors]
  
  def initialize(play)
    begin
      unless self.class.valid_play?(play)
        raise PlayTypeError
      else
        @play = play
        @computer_play = @@valid_plays.sample
      end
    end
  end
  
  def self.valid_play?(play)
   @@valid_plays.include? play
  end
  
  def won?
    winner = {:rock => :scissors, :paper => :rock, :scissors => :paper }
    winner[self.play] == self.computer_play
  end
  
  def tied?
    self.play == self.computer_play
  end
  
  def lost?
    !won? && !tied?
  end
end

class PlayTypeError < StandardError
end