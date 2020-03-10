class CfathleteCLI::CLI
    
    # def startx
    #     puts "test"
    #     @data = CfathleteCLI::API.get_athlete("male",1)
    # end

    def start
        puts "Welcome to the CrossFit Athlete CLI!",
        "This CLI parses data from the 2019 CrossFit Open Leaderboard.",
        "*Loading data from 2019 CrossFit Games Leaderboard...",
        ""
        search_type
    end
    
    def search_type
        puts "====== 2019 Crossfit Games Open Leadboard Search ======",
        "Please enter ATHLETE or RANK to begin your search:"
        input = gets.strip.downcase
        if input == "athlete" || input == "rank"
            search_gender(input)
        else
            puts "*Error: Please use one of the following commands to declare your search:",
            "*Error: ATHLETE or RANK ..."
            search_type
        end
    end
    
    def search_gender(type)
        puts "======== 2019 Crossfit Games Athlete Search ========",
        "Would you like to search the male or female leaderboard?",
        "   Please enter 'M' or 'F':"
        input = gets.strip.downcase
        if type == "athlete"
            if input == "m"
                athlete_search("male")
            elsif input == "f"
               athlete_search("female")
            else
                puts "*Error: incorrect format"
                search_gender  
            end
        elsif type == "rank"
            if input == "m"
                rank_search("male")
            elsif input == "f"
                rank_search("female")
            else
                puts "*Error: incorrect format"
                search_gender(type)  
            end
        else
            puts "*Error: Incorrect search type."
            exit
        end
    end

    def athlete_search(gender)
        "Please enter the athlete that you would like to search for (First Last):"
        input = gets.strip.downcase
        if input.match(/\A[[:alpha:][:blank:]]+\z/) == nil
            puts "*Error: Please provide your search in 'First Last' format."
            athlete_search
        else
            puts "Searching 2018 Leaderboard for #{input.titleize}'s' data..."
            athlete_information(input)
        end
    end

    def athlete_information(gender)
       
    end

    def rank_search(gender)
        if gender == "male"
            gen = "1"
        else
            gen = "2"
        end
        puts "====== 2019 CrossFit Games #{gender.capitalize} Leaderboard Search ======",
        "Please enter rank:"
        input = Integer(gets) rescue false
        if input && input > 0
            puts "Searching 2019 Leaderboard for the Rank #{input} #{gender.capitalize} Athlete...",
            ""
            @data = CfathleteCLI::API.get_athlete_by_rank(gen,input.to_i-1)
        else       
            puts "*Error: Please the # of the rank that you would like to search for"
            rank_search(gender)
        end
    end

    def exit
        puts "",
        "Would you like to start a new search (Y/N)"
        input = gets.strip.downcase
        if input == "y"
            start
        elsif input == "n"
            puts "Thank you, goodbye."
        else
            puts "Please type 'y' or 'n'."
            exit
        end
    end
       
end 

class String  
    def titleize
      self.split(/ |\_/).map(&:capitalize).join(" ")
    end
end