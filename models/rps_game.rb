class RPSGame
  attr_reader :play, :computer, :won, :lost, :tied
  
  @@valid_plays = [:rock, :paper, :scissors]
  
  def initialize(play)
    begin
      unless self.class.valid_play?(play)
        raise PlayTypeError
      else
        @play = play
        @computer = computer_play
        @won = won?
        @lost = lost?
        @tied = tied?
      end
    end
  end
  
  def self.valid_play?(play)
   @@valid_plays.include? play
  end
  
  def computer_play
    @@valid_plays.sample
  end
    
  def won?
    winner = {:rock => :scissors, :paper => :rock, :scissors => :paper }
    winner[self.play] == self.computer_play
  end
  
  def tied?
    tied = {:rock => :rock, :paper => :paper, :scissors => :scissors }
    tied[self.play] == self.computer_play
  end
  
  def lost?
    loser = {:rock => :paper, :paper => :scissors, :scissors => :rock }
    loser[self.play] == self.computer_play
  end
    
end

class PlayTypeError < StandardError
    "Invalid Move"
end