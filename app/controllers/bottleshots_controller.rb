class BottleshotsController < ApplicationController

  get '/bottleshots' do
    if logged_in?
      erb :'bottleshots/bottleshots'
    else
      redirect '/login'
    end
  end

  get '/bottleshots/new' do
    if logged_in?
      erb :'bottleshots/new'
    else
      redirect '/login'  
    end
  end

  post '/bottleshots' do
    if logged_in?
      @bottleshot = Bottleshot.create(varietal: params[:varietal], vintage: params[:vintage], user_id: session[:id], label_file: params[:label_file])
      @bottleshot.bottleshape = Bottleshape.find_by_id(params[:shape])
      if !params[:bottleshape][:name].empty?
        @bottleshot.bottleshape = Bottleshape.find_or_create_by(name: params[:bottleshape][:name])
        @bottleshot.save
      end
      @bottleshot.winecolor = Winecolor.find_by_id(params[:color])
      if !params[:winecolor][:name].empty?
        @bottleshot.winecolor = Winecolor.find_or_create_by(name: params[:winecolor][:name])
        @bottleshot.save
      end
      redirect "/bottleshots/#{@bottleshot.id}"
    else
      redirect '/login'  
    end
  end

  get '/bottleshots/:id' do
    @bottleshot = Bottleshot.find_by_id(params[:id])
    if logged_in? && @bottleshot[:user_id] == session[:id]
      erb :'bottleshots/show'
    elsif logged_in? && @bottleshot[:user_id] != session[:id]
      redirect '/bottleshots'
    else
      redirect '/login'  
    end
  end

  get '/bottleshots/:id/edit' do
    @bottleshot = Bottleshot.find_by_id(params[:id])
    if logged_in? && @bottleshot[:user_id] == session[:id]
      erb :'bottleshots/edit'
    elsif logged_in? && @bottleshot[:user_id] != session[:id]
      redirect '/bottleshots'
    else
      redirect '/login'
    end
  end

  patch '/bottleshots/:id/edit' do
    @bottleshot = Bottleshot.find_by_id(params[:id])
    if logged_in? && @bottleshot[:user_id] == session[:id]
      @bottleshot = Bottleshot.update(varietal: params[:varietal], vintage: params[:vintage], user_id: session[:id], label_file: params[:label_file])
      @bottleshot.bottleshape = Bottleshape.find_by_id(params[:shape])
      if !params[:bottleshape][:name].empty?
        @bottleshot.bottleshape = Bottleshape.find_or_create_by(name: params[:bottleshape][:name])
        @bottleshot.save
      end
      @bottleshot.winecolor = Winecolor.find_by_id(params[:color])
      if !params[:winecolor][:name].empty?
        @bottleshot.winecolor = Winecolor.find_or_create_by(name: params[:winecolor][:name])
        @bottleshot.save
      end
      redirect "/bottleshots/#{@bottleshot.id}"
    elsif logged_in? && @bottleshot[:user_id] != session[:id]
      redirect '/bottleshots'
    else
      redirect '/login'  
    end
  end

  delete '/bottleshots/:id' do
    @bottleshot = Bottleshot.find_by_id(params[:id])
    if logged_in? && @bottleshot[:user_id] == session[:id]
      @bottleshot.delete
      redirect '/bottleshots'
    elsif logged_in? && @bottleshot[:user_id] != session[:id]
      redirect '/bottleshots'
    else
      redirect '/login'
    end

  end

end