require 'sinatra/base'
require 'sinatra/flash'

class BattleShipsWeb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/new_game' do
    @flash = session.delete(:notice) if session[:notice]
    erb :new_game
  end

  post '/play' do
    session[:notice] = "Must enter name to play"
    redirect to '/new_game' if params[:Name].length == 0
    @name = params[:Name]
    erb :play
  end

  run! if app_file == $0
end
