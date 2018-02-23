require './config/environment'


class UsersController < ApplicationController

    get '/garages' do
        redirect_if_not_logged_in

        @garages = Garage.all

        erb :'/garages/index'
    end

    get '/garages/new' do
        redirect_if_not_logged_in

        erb :'/garages/create'
    end

    post '/garages' do
        if Garage.valid_params?(params)
            garage = Garage.create(params)
            garage.user = current_user
            garage.save
            redirect "/garages/#{garage.id}"
        else
            flash[:message] = "Fields cannot be blank"
            redirect '/garages/new'
        end
    end

    get '/garages/:id' do
        redirect_if_not_logged_in

        @garage = Garage.find(params[:id])

        erb :'/garages/show'
    end

end