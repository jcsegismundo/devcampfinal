module ItemsHelper
	include ActionView::Helpers::NumberHelper
	def print_money(item)
		number_with_precision(item.price, precision: 2, delimiter: ',')
	end
end
