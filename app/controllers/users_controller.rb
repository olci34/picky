class UsersController < ApplicationController

  get '/signup' do
    erb :'users/new'
  end

  post '/signup' do
    user = User.create(params[:user])
    session[:id] = user.id
    redirect '/pickies'
  end
end
