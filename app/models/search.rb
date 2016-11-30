class Search < ActiveRecord::Base
	has_and_belongs_to_many :listings
	default_scope { where(available: true) }
	before_validation :check_for_nil_value, on: :create

	def check_for_nil_value
		if available == nil
			self.available = true
		end

		if low_price == nil
			self.low_price = 100
		end

		if high_price == nil
			self.high_price = 100000
		end
	end
end
