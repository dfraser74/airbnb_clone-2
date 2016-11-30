class Search < ActiveRecord::Base
	has_and_belongs_to_many :listings
	default_scope { where(available: true) }
	before_validation :check_for_nil_value, on: :create

	def check_for_nil_value
		if available == nil
			self.available = true
		end

		if low_price == nil
			self.low_price = 0
		end

		if high_price == nil
			self.high_price = 100000
		end

		if max_occupancy == nil
			self.max_occupancy = 0
		end

		if number_of_rooms == nil
			self.number_of_rooms = 0
		end
	end
end
