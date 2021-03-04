class ProductsController < ApplicationController

  get '/pickies' do
    if logged_in?
      @pickies = Product.all
      erb :"/products/index"
    else
      redirect '/'
    end
  end

  get '/pickies/new' do
    if logged_in?
      erb :'products/new'
    else
      redirect '/'
    end
  end

  post '/pickies' do
    user = User.find_by_id(session[:id])
    product = user.products.create(params[:product])
    location = Location.find_or_create_by(params[:location])
    product.location_id = location.id
    product.save
    redirect '/pickies'
  end

  get '/pickies/:id' do
    if logged_in?
      @picky = Product.find_by_id(params[:id])
      erb :'products/show'
    else
      redirect '/'
    end
  end

  get '/pickies/:id/edit' do
    if logged_in?
      @picky = Product.find_by_id(params[:id])
      if @picky.user_id == session[:id]
        erb :'products/edit'
      else
        redirect "/pickies/#{@picky.id}"
      end
    else
      redirect '/'
    end
  end

  delete '/pickies/:id' do
    @picky = Product.find_by_id(params[:id])
    if @picky.user_id == session[:id]
      @picky.destroy
      redirect '/pickies'
    else
      redirect '/'
    end
  end
  
end
