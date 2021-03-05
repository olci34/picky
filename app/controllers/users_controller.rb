class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/new'
    else
      redirect '/pickies'
    end
  end

  post '/signup' do
    if signup_valid?(params[:user])
      user = User.create(params[:user])
      session[:id] = user.id
      redirect '/pickies'
    else
      redirect '/signup'
    end
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
    redirect_if_not_logged_in
    session.clear
    redirect '/login'
  end

  get '/users/:slug' do
    redirect_if_not_logged_in
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end
end
