require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  register Sinatra::Flash

  get "/" do
    if !logged_in?
      erb :welcome
    else
      redirect '/pickies'
    end
  end

  helpers do
    
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user = User.find_by(id: session[:id]) if session[:id]
    end

    def redirect_if_not_logged_in
      redirect '/login' unless logged_in?
    end

    def set_picky
      @picky = Product.find_by(id: params[:id])
    end

    def check_owner(obj)
      obj && obj.user == current_user
    end

    def redirect_if_not_owner(obj)
      redirect '/pickies' if !check_owner(obj)
    end
  end

end