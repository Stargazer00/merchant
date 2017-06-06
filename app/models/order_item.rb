class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :product

	validates_associated :order, :product
	validates :quantity, numericality: { only_integer: true, greater_than: 0 }

	def subtotal 
		quantity * product.price
	end
end
