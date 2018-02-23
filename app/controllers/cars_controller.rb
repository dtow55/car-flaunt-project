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
        @garage = @car.garage
        erb :'/cars/show'
        #make owner into link so you can see a user's garages
    end

    patch '/cars/:id/edit' do
        #check garage capacity
    end

    delete '/cars/:id/delete' do
        car = Car.find(params[:id])
        garage = car.garage
        car.destroy
        redirect "/garages/#{garage.id}"
    end

end