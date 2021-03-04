class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/new'
    else
      redirect '/pickies'
    end
  end

  post '/signup' do
    user = User.create(params[:user])
    session[:id] = user.id
    redirect '/pickies'
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/pickies'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:id] = user.id
      redirect '/pickies'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else 
      redirect '/'
    end
  end
end
