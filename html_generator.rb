class HtmlGenerator
	def show 
		print_header
		puts "Action Show"
		print_footer
	end

	def index
		print_header
		puts "Action: Index"
		print_footer
	end

	private

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
end