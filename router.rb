require_relative 'html_generator'

if ARGV.empty? 
	puts "USAGE: bla"
else
	puts "You passed in arguements! YAY!"
	generator = HtmlGenerator.new

	if ARGV[0] == "index"
		generator.index
	elsif ARGV[0] == "show"
		generator.show
	else
		puts "Refer to USAGE. 'index' or 'show' are acceptable."
	end
		
end
