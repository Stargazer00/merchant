module ProductsHelper
	def print_price(price)
		number_to_currency price
	end

	def print_stock(stock, requested = 1)
		content_tag(:span, "Out of Stock (#{stock})", class: "out_stock") if (stock < 0)
		((stock > 0) && (stock >= requested)) ? content_tag(:span, " In Stock (#{stock})", class: "in_stock"): content_tag(:span, "Insufficient Stock (#{stock})", class: "low_stock")
	end  
end
