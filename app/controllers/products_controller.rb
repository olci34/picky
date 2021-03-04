class ProductsController < ApplicationController

  get '/pickies' do
    @pickies = Product.all
    erb :'products/index'
  end
end
