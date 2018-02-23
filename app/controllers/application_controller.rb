require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "secret"
    end

    get '/' do
        erb :index
    end

end

class Helpers

    def self.logged_in?(session)
      !!session[:user_id]
    end
  
    def self.current_user(session)
      User.find(session[:user_id])
    end
  
    def redirect_if_not_logged_in(session)
        if !logged_in?(session)
            # Redirect somehwere
        end
    end
  
  end