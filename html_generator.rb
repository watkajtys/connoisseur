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
		puts "<p>#{product['name']}</p>"
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

	def retrieve_data()
		response = open("http://lcboapi.com/products").read
		data = JSON.parse(response)
		return data["result"]
	end
end