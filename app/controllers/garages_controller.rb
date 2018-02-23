require './config/environment'


class UsersController < ApplicationController

    get '/garages' do
        redirect_if_not_logged_in

        @garages = Garage.all

        erb :'/garages/index'
    end

end