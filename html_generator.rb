require 'open-uri'
require 'json'

class HtmlGenerator
	def show(id)
		print_header
		puts "Action: Show"

		product_detail = retrieve_data("http://lcboapi.com/products/#{id}")
		display_product_detail(product_detail)

		print_footer
	end

	def index
		print_header
		puts "Action: Index"

		products = retrieve_data("http://lcboapi.com/products/")

		products.each do |product|
			display_product(product)
		end

		print_footer
	end

	private

	def display_product_detail(product_detail)
		puts "<h2>#{product_detail['name']}</h2>"
		puts "<img src=#{product_detail['image_url']}></img>"
		puts "<ul>
				<li>ID: #{product_detail['id']}</li>
				<li>#{product_detail['producer_name']}</li>
				<li>#{product_detail['primary_category']}</li>
				<li>#{product_detail['secondary_category']}</li>
				<li>#{product_detail['package']}</li>
				<li>#{product_detail['serving_suggestion']}</li>
				<li>#{product_detail['tasting_note']}</li>
				<li>Alcohol Content: #{product_detail['alcohol_content'].to_f/100}</li>
				<li>$#{product_detail['price_in_cents'].to_f/100}</li>
			</ul>"
	end

	def display_product(product)
		puts "<h2>#{product['name']}</h2>"
		puts "<img src=#{product['image_thumb_url']}></img>"
		puts "<ul>
				<li>ID: #{product['id']}</li>
				<li>#{product['producer_name']}</li>
				<li>#{product['primary_category']}</li>
				<li>#{product['secondary_category']}</li>
				<li>#{product['package']}</li>
				<li>$#{product['price_in_cents'].to_f/100}</li>
			</ul>"
	end

	def print_header
		puts "<html>"
		puts 	"<head>"
		puts 		"<title>Connoisseur in the head</title>"
		puts 	"</head>"
		puts 	"<body>"
	end

	def print_footer
		puts 	"</body>"
		puts "</html>"
	end

	def retrieve_data(url)
		response = open(url).read
		data = JSON.parse(response)
		return data["result"]
	end
end