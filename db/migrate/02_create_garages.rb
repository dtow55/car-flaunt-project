class CreateGarages < ActiveRecord::Migration
	def change
        create_table :garages do |t|
            t.string :name
            t.integer :capacity
			t.integer :user_id
		end
	end
end
