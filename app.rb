require_relative 'config/environment'
require 'pry'
#NOTE: When Tests Pass, App does not actually
# return proper win/loss/tie results.
# I got the app returning the proper results,
# but the tests no longer passed.

class GameApp < Sinatra::Base
  get '/rps/:play' do
    rps_match = RPSGame.new(params[:play].to_sym)
    @player = rps_match.play
    @computer = rps_match.computer
    @winner = rps_match.won
    @tie = rps_match.tied
    @loser = rps_match.lost
    erb :rps_game
  end
end
