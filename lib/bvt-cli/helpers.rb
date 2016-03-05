module Helpers

  
  #displays an error message if one was given and then exits the program
  def Helpers.die(message)
    puts "[ERROR] #{message}" if message
    exit
  end



  #Prompts the user for a league name. The leagues that can be selected depend
  #on what federation was given as an argument.
  def Helpers.prompt_league_name(federation)

    #print all league names to the screen
    puts "\nAvailable leagues:"
    leagues = federation.get_league_names
    (1..(leagues.length)).each do |n|
      puts "#{n}:\t#{leagues[n-1]}"
    end

    #let user select league
    puts "Enter the number of the league you'd like to select:"
    input = $stdin.gets.chomp.to_i

    return leagues[input - 1]
  end



  #Prompts the user for a team name. The teams that can be selected depend
  #on what league was given as an argument.
  def Helpers.prompt_team_name(league)
    puts "\nAvailable teams in #{league.name}:"
    team_list = league.get_teams.sort
    (1..(team_list.length)).each do |n|
      puts "#{n}:\t#{team_list[n-1]}"
    end

    puts "Enter the number of the team you'd like to select:"
    input = $stdin.gets.chomp.to_i
    team_name = team_list[input - 1]
  end
end