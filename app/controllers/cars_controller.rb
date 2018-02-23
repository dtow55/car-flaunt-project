require './config/environment'


class CarsController < ApplicationController

    get '/cars/new' do
        redirect_if_not_logged_in

        erb :'/cars/create'
    end

    post '/cars' do
        binding.pry
        if Car.valid_params?(params)
            car = Car.create(params)
            #check for capacity of garage?
            car.save
            redirect "/cars/#{car.id}"
        else
            flash[:message] = "Fields cannot be blank"
            redirect '/garages/new'
        end
    end

    get '/cars/:id' do
        @car = Car.find(params[:id])
    end

end