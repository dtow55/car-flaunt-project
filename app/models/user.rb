class User < ActiveRecord::Base
    has_secure_password
    has_many :garages
    has_many :cars, through: :garages

    def self.valid_params?(params)
        !(params[:username].empty? || params[:password].empty?)
    end
end
