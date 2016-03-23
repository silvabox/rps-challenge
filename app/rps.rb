require 'sinatra/base'
require './lib/computer'
require './lib/player'

class RPS < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/game' do
    session[:name] = params[:name]
    puts params[:name]
    redirect :play
  end

  get '/play' do
    redirect '/' unless session[:name]
    @name = session[:name]
    erb :play
  end

  post '/play' do
    @player = Player.new
    @player.choose Weapon[params[:choice]]
    @computer = Computer.new
    erb @player.vs(@computer)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
