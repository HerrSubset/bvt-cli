#general requires
require "thor"
require "bvt"


#require other parts of the application
require "bvt-cli/helpers.rb"


class BvtCli < Thor

	##############################################################################
	## Calendar Command
	##############################################################################

	option :f, :required => true
	option :l
	option :t
	desc "calendar -f <federation> [-l <league>] [-t <team>]",
				"Prints the calendar of a certain team. You will be prompted for the
				relevant information if you did not provide it with the flags."
	def calendar
		#get federation
		fed_name = ""
		fed_name = options[:f] if options[:f]
		fed = Bvt.load_federation(fed_name)

		#exit if invalid federation was requested
		Helpers.die("Unknown federation") if fed == nil


		#get league
		league_name =  ""
		league_name = options[:l] if options[:l]

		#ask user for league name if none was given
		league_name = Helpers.prompt_league_name(fed) if league_name == ""

		league = fed.get_league(league_name)

		#exit if invalid league was requested
		Helpers.die("Unknown league") if league == nil


		#get team name
		team_name = ""
		team_name = options[:t] if options[:t]
		team_name = Helpers.prompt_team_name(league) if team_name == ""


		#print calendar to screen
		puts "\nCalendar for #{team_name}:"
		team_games = league.get_team_games(team_name)

		team_games.each do |g|
		  puts g.to_s
		end
	end




	##############################################################################
	## Rankings Command
	##############################################################################

	option :f, :required => true
	option :l
	desc "rankings -f <federation> [-l <league>]", "Print the rankings table for
				a certain league"
	def rankings
		#get federation
		fed_name = ""
		fed_name = options[:f] if options[:f]

		fed = Bvt.load_federation(fed_name)
		Helpers.die("Unknown federation") if fed == nil


		#get league
		league_name =  ""
		league_name = options[:l] if options[:l]

		#ask user for league name if none was given
		league_name = Helpers.prompt_league_name(fed) if league_name == ""

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

		#print all lines in the ranking table
		ranking.each do |r|
		  puts "#{r['name']}\t#{r['played']}\t#{r['3_points']}\t#{r['2_points']}\t#{r['1_point']}\t#{r['0_points']}\t#{r['won_sets']}\t#{r['lost_sets']}\t#{r['points']}"
		end
	end
end
