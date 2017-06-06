class Address < ApplicationRecord
	has_many :orders
	belongs_to :user

	validates :line1, presence: true
	validates :city, presence: true
	validates :zip, presence: true, numericality: { only_integer: true }, length: { is: 5 }
	validates :state, presence: true, length: { is: 2 }, uniqueness: { case_sensitive: true }

	def to_s
		arr = []
		arr.push(self["line1"],self["line2"],self["city"],self["state"],self["zip"])
		arr = arr.compact.join(", ")
	end
end
