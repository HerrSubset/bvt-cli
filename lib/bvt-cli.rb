require "thor"
require "bvt"

class BvtCli < Thor

	option :f
	option :l
	option :t
	desc "calendar -f <federation> [-l <league>] [-t <team>]",
				"Prints the calendar of a certain team. You will be prompted for the
				relevant information if you did not provide it with the flags."
	def calendar
		fed_name = ""
		fed_name = options[:f] if options[:f]

		fed = Bvt.load_federation(fed_name)

		if fed == nil
			puts "[ERROR] Unknown federation"
			exit
		end

		league_name =  ""
		league_name = options[:l] if options[:l]

		#select a league if none was given
		if league_name == ""
			#print all league names to the screen
			puts "\nAvailable leagues:"
			leagues = fed.get_league_names
			(1..(leagues.length)).each do |n|
			  puts "#{n}:\t#{leagues[n-1]}"
			end

			#let user select league
			puts "Enter the number of the league you'd like to select:"
			input = $stdin.gets.chomp.to_i
			league_name = leagues[input - 1]
		end

		league = fed.get_league(league_name)

		if league == nil
			puts "[ERROR] Unknown league"
			exit
		end


		team_name = ""
		team_name = options[:t] if options[:t]

		if team_name == ""
			puts "\nAvailable teams in #{league.name}:"
			team_list = league.get_teams.sort
			(1..(team_list.length)).each do |n|
			  puts "#{n}:\t#{team_list[n-1]}"
			end

			puts "Enter the number of the team you'd like to select:"
			input = $stdin.gets.chomp.to_i
			team_name = team_list[input - 1]
		end

		puts "\nCalendar for #{team_name}:"
		team_games = league.get_team_games(team_name)

		team_games.each do |g|
		  puts g.to_s
		end
	end
end
