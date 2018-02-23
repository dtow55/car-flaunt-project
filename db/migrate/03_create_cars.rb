class CreateCars < ActiveRecord::Migration
	def change
        create_table :cars do |t|
            t.string :model
            t.string :manufacturer
            t.string :year
			t.integer :garage_id
		end
	end
end
