class Garage < ActiveRecord::Base
    belongs_to :user
    has_many :cars

    def self.valid_params?(params)
        !(params[:name].empty? || params[:capacity].empty?)
    end
end
