require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "secret"
        use Rack::Flash
    end
    
    get '/' do
        erb :index
    end

    # Developer route; not to be used by users. 
    get '/clear' do
        session.clear
        User.destroy_all
        Garage.destroy_all
        Car.destroy_all
    end

    helpers do 

        def logged_in?
            !!session[:user_id]
          end
        
        def current_user
            User.find(session[:user_id])
        end
    
        def redirect_if_not_logged_in
            if !logged_in?
                redirect '/login'
            end
        end

        def redirect_if_logged_in
            if logged_in?
                redirect "users/#{session[:user_id]}"
            end
        end

    end

end
