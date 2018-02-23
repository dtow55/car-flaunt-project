class CreateGarages < ActiveRecord::Migration
	def change
        create_table :garages do |t|
            t.string :name
            t.string :capacity
			t.integer :user_id
		end
	end
end
