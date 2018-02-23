class User < ActiveRecord::Base
    has_secure_password
    has_many :garages
    has_many :cars, through: :garages
end
