require 'sinatra/base'
require './lib/computer'
require './lib/player'

class RPS < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/game/new' do
    session[:name] = params[:name]
    @name = session[:name]
    erb :game
  end

  post '/game' do
    @player = Player.new
    @player.choose Weapon[params[:choice]]
    @computer = Computer.new
    erb @player.vs(@computer)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
