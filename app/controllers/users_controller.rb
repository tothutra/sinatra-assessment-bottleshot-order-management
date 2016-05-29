class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/bottleshots'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if params[:name] == "" || params[:password] == "" || params[:email] == ""
      redirect '/signup'
    else
      @user = User.create(name: params[:name], email: params[:email], password: params[:password], company_name: params[:company_name])
      session[:id] = @user.id
      redirect '/bottleshots'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect "/bottleshots"
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect '/bottleshots'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

end