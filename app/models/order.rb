class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	belongs_to :user, optional: true
	belongs_to :address, optional: true

	def total
		total = 0
	 	order_items.each do |item|
	 		total += item.subtotal
	 	end
	 	total
	end
end
