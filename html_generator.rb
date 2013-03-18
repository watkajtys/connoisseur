require 'open-uri'
require 'json'

class HtmlGenerator
	def show 
		print_header
		puts "Action Show"
		print_footer
	end

	def index
		print_header
		puts "Action: Index"

		products = retrieve_data

		products.each do |product|
			display_product(product)
		end

		print_footer
	end

	private

	def display_product(product)
		puts "<h2>#{product['name']}</h2>"
		puts "<img src=#{product['image_thumb_url']}></img>"
		puts "<ul>
				<li>#{product['id']}</li>
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
		puts    "<style> ul{float: right}</style>"
		puts 	"</head>"
		puts 	"<body>"
	end

	def print_footer
		puts 	"</body>"
		puts "</html>"
	end

	def retrieve_data()
		response = open("http://lcboapi.com/products").read
		data = JSON.parse(response)
		return data["result"]
	end
end