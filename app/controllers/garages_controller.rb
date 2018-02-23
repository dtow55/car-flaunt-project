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

    delete '/garages/:id/delete' do
        Garage.find(params[:id]).destroy
        flash[:message] = "Successfully deleted garage"
        redirect '/garages'
    end

    patch '/garages/:id/edit' do
        garage = Garage.find(params[:id])

        if !params[:name].empty?
            garage.name = params[:name]
            garage.save
        end

        if !params[:capacity].empty?
            garage.capacity = params[:capacity]
            garage.save
        end

        flash[:message] = "Edits were successful"
        redirect "/garages/#{garage.id}"
    end

end