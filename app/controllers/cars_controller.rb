require './config/environment'


class CarsController < ApplicationController

    get '/cars/new' do
        redirect_if_not_logged_in

        erb :'/cars/create'
    end

    post '/cars' do
        if Car.valid_params?(params)
            # Check Garage Capacity
            garage = Garage.find(params[:garage_id])
            if garage.cars.count == garage.capacity
                flash[:message] = "That garage is full"
                redirect '/cars/new'
            else
                car = Car.create(params)
                car.save
                redirect "/cars/#{car.id}"
            end
        else
            flash[:message] = "Fields cannot be blank"
            redirect '/cars/new'
        end
    end

    get '/cars/:id' do
        redirect_if_not_logged_in
        @car = Car.find(params[:id])
        #show car (includes edit form)
    end

    patch '/cars/:id/edit' do

    end

    delete '/cars/:id/delete' do
    
    end

end