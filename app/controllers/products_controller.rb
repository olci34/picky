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
end
