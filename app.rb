class GameApp < Sinatra::Base
  get '/rps/:play' do
    @rps_match = RPSGame.new(params[:play].to_sym)
    erb :rps_game
  end
end
