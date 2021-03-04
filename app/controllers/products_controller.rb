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
end
