require "thor"

class BvtCli < Thor

	desc "hello NAME", "say hello to NAME"
	option :f
	def hello(name)
		puts "from: #{options[:f]}" if options[:f]
		puts "Hello #{name}"
	end
end
