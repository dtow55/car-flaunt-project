require './config/environment'


class UsersController < ApplicationController

    get '/signup' do
        redirect_if_logged_in

        erb :'/users/signup'
    end

    post '/signup' do
        if User.valid_params?(params)
            user = User.create(params)
            session[:user_id] = user.id
            redirect "users/#{session[:user_id]}"
        end

        # Handle empty username / password entries
        flash[:message] = "Please enter a valid username and password"
        redirect '/signup'
    end

    get '/login' do
        redirect_if_logged_in

        erb :'/users/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{session[:user_id]}"
        else
            flash[:message] = "Invalid login information"
            redirect '/login'
        end
    end

    post '/users/:id/logout' do
        redirect_if_not_logged_in

        session.clear

        redirect '/'
    end 

    get '/users/:id' do
        redirect_if_not_logged_in

        @user = User.find(params[:id])

        erb :'/users/show'
    end

end