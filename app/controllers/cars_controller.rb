require './config/environment'


class CarsController < ApplicationController

    get '/cars/new' do
        redirect_if_not_logged_in

        erb :'/cars/create'
    end

    post '/cars' do
        if Car.valid_params?(params)
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
        car = Car.find(params[:id])

        if !params[:model].empty?
            car.model = params[:model]
            car.save
        end

        if !params[:manufacturer].empty?
            car.manufacturer = params[:manufacturer]
            car.save
        end

        if !params[:year].empty?
            car.year = params[:year]
            car.save
        end

        if !params[:garage_id].empty?

            current_garage = Garage.find(car.garage_id)
            selected_garage = Garage.find(params[:garage_id])
            
            # If user selects a different garage, do a capacity check
            if selected_garage != current_garage
                if selected_garage.cars.count == selected_garage.capacity
                    flash[:message] = "That garage is full"
                    redirect "cars/#{car.id}"
                else
                    car.garage = selected_garage
                    car.save
                end
            end
        end

        flash[:message] = "Edits were successful"
        redirect "/cars/#{car.id}"

        #check garage capacity
    end

    delete '/cars/:id/delete' do
        car = Car.find(params[:id])
        garage = car.garage
        car.destroy
        flash[:message] = "Successfully deleted car"
        redirect "/garages/#{garage.id}"
    end

end