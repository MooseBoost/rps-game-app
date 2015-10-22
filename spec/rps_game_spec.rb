require 'spec_helper'

describe RPSGame do
  describe "#new" do
    it "should accept valid play types" do
      expect { RPSGame.new(:rock)     }.to_not raise_error
      expect { RPSGame.new(:paper)    }.to_not raise_error
      expect { RPSGame.new(:scissors) }.to_not raise_error
    end

    it "should raise an error for invalid types" do
      expect { RPSGame.new(:dynamite) }.to raise_error(RPSGame::PlayTypeError)
    end
  end

  describe "#valid_play?" do
    it "should return true for the symbol :paper" do
      expect(RPSGame.valid_play?(:paper)).to eq(true)
    end

    it "should return true for the symbol :rock" do
      expect(RPSGame.valid_play?(:rock)).to eq(true)
    end

    it "should return true for the symbol scissors" do
      expect(RPSGame.valid_play?(:scissors)).to eq(true)
    end

    it "should return false for other values" do
      expect(RPSGame.valid_play?(:dynamite)).to eq(false)
    end
  end

  describe "#computer_play" do
    let(:choices) { [:scissors, :rock, :paper] }
    it "should return the computer's play" do
      game = RPSGame.new(:rock)

      expect(choices).to include(game.computer_play)
    end
  end

  describe "#won?" do
    it "should return true if the player won" do
      allow_any_instance_of(RPSGame).to receive(:computer_play).and_return(:scissors)
      game = RPSGame.new(:rock)

      expect(game.won?).to eq(true)
    end

    it "should return false if the player lost" do
      allow_any_instance_of(RPSGame).to receive(:computer_play).and_return(:paper)
      game = RPSGame.new(:rock)

      expect(game.won?).to eq(false)
    end

    it "should return false if the player tied" do
      allow_any_instance_of(RPSGame).to receive(:computer_play).and_return(:rock)
      game = RPSGame.new(:rock)

      expect(game.won?).to eq(false)
    end
  end

  describe "#tied?" do
    it "should return true if the player tied" do
      allow_any_instance_of(RPSGame).to receive(:computer_play).and_return(:rock)
      game = RPSGame.new(:rock)

      expect(game.tied?).to eq(true)
    end

    it "should return false if the player won" do
      allow_any_instance_of(RPSGame).to receive(:computer_play).and_return(:scissors)
      game = RPSGame.new(:rock)

      expect(game.tied?).to eq(false)
    end

    it "should return false if the player lost" do
      allow_any_instance_of(RPSGame).to receive(:computer_play).and_return(:paper)
      game = RPSGame.new(:rock)

      expect(game.tied?).to eq(false)
    end
  end

  describe "#lost?" do
    it "should return true if the player lost" do
      allow_any_instance_of(RPSGame).to receive(:computer_play).and_return(:paper)
      game = RPSGame.new(:rock)

      expect(game.lost?).to eq(true)
    end

    it "should return false if the player won" do
      allow_any_instance_of(RPSGame).to receive(:computer_play).and_return(:scissors)
      game = RPSGame.new(:rock)

      expect(game.lost?).to eq(false)
    end

    it "should return false if the player tied" do
      allow_any_instance_of(RPSGame).to receive(:computer_play).and_return(:rock)
      game = RPSGame.new(:rock)

      expect(game.lost?).to eq(false)
    end
  end
end
