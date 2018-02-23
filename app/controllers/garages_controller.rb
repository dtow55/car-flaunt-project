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

end