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
end
