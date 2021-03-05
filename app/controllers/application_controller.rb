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
      flash[:message] = "This item does not belong to you"
      redirect '/pickies' if !check_owner(obj)
    end

    def username_valid?(username)
      # ^[a-zA-Z0-9]{4,8}$
      word = username.match(/^[a-zA-Z0-9]\w{3,7}$/)
      word.to_s == username if word
    end

    def password_valid?(password)
      # ^[a-zA-Z0-9]{4,8}$
      passcode = password.match(/^[a-zA-Z0-9]{6,10}$/)
      passcode.to_s == password if passcode
    end

    def signup_valid?(hash)
      if !params[:user].values.any? {|v| v == ""}
        username_valid?(hash[:username]) && password_valid?(hash[:password])
      else
        false
      end
    end

    def picky_valid?
      name_valid = !params[:product].values.any? {|v| v.strip == ""}
      location_valid = !params[:location].values.any? {|v| v.strip == ""}
      name_valid && location_valid
    end
  end

end