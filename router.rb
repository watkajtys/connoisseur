# Access params passed into the app

if ARGV.empty? 
	puts "USAGE: bla"
else
	puts "You passed in arguements! YAY!"

	if ARGV[0] == "index"
		puts "Action: INDEX"
	elsif ARGV[0] == "show"
		puts "Action: Show"
	else
		puts "Refer to USAGE. 'index' or 'show' are acceptable."
	end
		
end
