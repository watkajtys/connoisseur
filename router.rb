require_relative 'html_generator'

if ARGV.empty? 
	puts "USAGE: bla"
else
	generator = HtmlGenerator.new

	if ARGV[0] == "index"
		generator.index
	elsif ARGV[0] == "show"
		id = ARGV[1]
		generator.show(id)
	else
		puts "Refer to USAGE. 'index' or 'show' are acceptable."
	end
		
end
