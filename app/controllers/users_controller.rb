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
      if user.valid?
        session[:id] = user.id
        redirect '/pickies'
      else
        flash[:message] = user.errors.full_messages.to_sentence
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
      flash[:message] = "You entered invalid username or password"
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
