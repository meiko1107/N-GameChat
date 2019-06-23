require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user])
  end
end

get '/' do
  @toukous = Toukou.all.order(id: "ASC")
  erb :index
end

post '/toukou' do
  toukou = Toukou.create(
        user_id: params[:user_id],
        name: params[:name],
        body: params[:body]
        )
  redirect '/'
end

get '/signin' do
  erb :sign_in
end

get '/signup' do
  erb :sign_up
end

post '/signin' do
  user = User.find_by(mail: params[:mail])
  if user && user.authenticate(params[:password])
    session[:user] = user.id
  end
  redirect '/'
end

post '/signup' do
  user = User.create(name: params[:name],
    mail: params[:mail], password: params[:password],
  password_confirmation: params[:password_confirmation])
  if user.persisted?
    session[:user] = user.id
  end
  redirect '/'
end

get '/signout' do
  session[:user] = nil
  redirect '/'
end
