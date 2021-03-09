class ProductsController < ApplicationController

  get '/pickies' do
    redirect_if_not_logged_in
    @pickies = Product.all
    erb :"/products/index"
  end

  get '/pickies/new' do
    redirect_if_not_logged_in
    erb :'products/new'
  end

  post '/pickies' do
    user = User.find_by_id(session[:id])
    product = user.products.create(params[:product])
    if product.valid?
      location = Location.find_or_create_by(params[:location])
      product.location_id = location.id
      product.save
      redirect '/pickies'
    else
      flash[:message] = "Information is missing. Please fill in all the blanks."
      redirect '/pickies/new'
    end
  end

  get '/pickies/:id' do
    redirect_if_not_logged_in
    set_picky
    if @picky
      erb :'products/show'
    else
      redirect '/pickies'
    end
  end

  get '/pickies/:id/edit' do
    redirect_if_not_logged_in
    set_picky
    redirect_if_not_owner(@picky)
    erb :'products/edit'
  end

  patch '/pickies/:id' do
    redirect_if_not_logged_in
    set_picky
    if @picky.update(params[:product])
    @picky.location.update(params[:location])
    
    
    else
      flash[:message] = "Picky name can't be blank."
    end
    redirect "/pickies/#{@picky.id}"
  end

  delete '/pickies/:id' do
    redirect_if_not_logged_in
    set_picky
    redirect_if_not_owner(@picky)
    @picky.destroy
    redirect '/pickies'
  end
end
