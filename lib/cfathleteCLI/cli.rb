class CfathleteCLI::CLI
    
    #start should greet user and give description
    #get data from api
    #create new custom objs
    #all inside start method
    def start
        puts "Welcome to the CrossFit Athlete CLI!",
        "This CLI parses data from the 2018 Crossfit Open Leaderboard.",
        "*Loading data from 2018 CF Leadboard...",
        ""
        search_type
    end

   def search_type
        puts "========== CF Athlete Search ==========",
        "Please enter ATHLETE, AFFILIATE, or REGION to begin your search:"
        input = gets.strip.downcase
        if input == "athlete"
            puts "Please enter the athlete that you would like to search for (First Last):"
        elsif input == "affiliate"
            puts "Please enter the affiliate that you would like to search for:"
        elsif input == "region"
            puts "Please enter the affiliate that you would like to search for"
        else
            puts "You must type ATHLETE, AFFILIATE, or REGION to begin your search."
        end
    end
    
    #deals with inputs
    #while inpute =/= exit, do ...
    #display a list of something, or give examples of what we expect as input
    #get user input
    #depending on what we get, do something
    #condition to check input for good value
    #else tell them try again
    # def display_info
    #     puts ":"
    #     input = gets.strip.downcase

    #     if input == "athlete"
    #         puts "////////// AthleteList //////////"
    #         puts "List"
    #     elsif input == "regionName"
    #         puts ""
    #     elsif input == "affiliateName"
    #         puts "////////// Affiliate Athlete List //////////",
    #         puts "Affiliate: ${input}"
    #         puts "Athlete list"
        
    
    # end

    # def exit
    #     # if input == "exit"
    #     #     kill program
    #     # end
    # end

end   