#general requires
require "thor"
require "bvt"


#require other parts of the application
require "bvt-cli/helpers.rb"


class BvtCli < Thor

	option :f, :required => true
	option :l
	option :t
	desc "calendar -f <federation> [-l <league>] [-t <team>]",
				"Prints the calendar of a certain team. You will be prompted for the
				relevant information if you did not provide it with the flags."
	def calendar
		fed_name = ""
		fed_name = options[:f] if options[:f]

		fed = Bvt.load_federation(fed_name)

		Helpers.die("Unknown federation") if fed == nil

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

		Helpers.die("Unknown league") if league == nil

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


	option :f, :required => true
	option :l
	desc "rankings -f <federation> [-l <league>]", "Print the rankings table for
				a certain league"
	def rankings
		fed_name = ""
		fed_name = options[:f] if options[:f]

		fed = Bvt.load_federation(fed_name)

		Helpers.die("Unknown federation") if fed == nil

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

		Helpers.die("Unknown league") if league == nil


		#print league rankings
		ranking = league.get_rankings

		#make all team name strings equal in length by adding spaces
		longest = 0
		ranking.each do |r|
		  if r["name"].length > longest
		    longest = r["name"].length
		  end
		end

		ranking.each do |r|
		  difference = longest - r["name"].length
		  r["name"] += " " * difference
		end


		ranking.each do |r|
		  puts "#{r['name']}\t#{r['played']}\t#{r['3_points']}\t#{r['2_points']}\t#{r['1_point']}\t#{r['0_points']}\t#{r['won_sets']}\t#{r['lost_sets']}\t#{r['points']}"
		end
	end
end
