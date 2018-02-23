class Car < ActiveRecord::Base
    belongs_to :garage

    def self.valid_params?(params)
        binding.pry
        !(params[:model].empty? || params[:manufacturer].empty? || params[:year].empty? || !!params[:garage_id].empty?)
    end
end
