require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "secret"
    end

    get '/' do

    end

end

class Helpers

    def self.is_logged_in?(session)
      !!session[:user_id]
    end
  
    def self.current_user(session)
      User.find(session[:user_id])
    end
  
    def self.valid_signup_info?(params)
      params[:username] == "" || params[:password] == ""
    end
  
  end