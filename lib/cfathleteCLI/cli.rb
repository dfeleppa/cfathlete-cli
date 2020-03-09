class CfathleteCLI::CLI
    
    #start should greet user and give description
    #get data from api
    #create new custom objs
    #all inside start method
    def start
        puts "Welcome to the CrossFit Athlete CLI!",
        "This CLI parses data from the 2018 Crossfit Open Leaderboard.",
        "*Loading data from 2018 CF Open Leaderboard...",
        ""
        search_type
    end

    def search_type
        puts "====== 2018 Crossfit Games Open Leadboard Search ======",
        "Please enter ATHLETE, AFFILIATE, or OPEN WORKOUT to begin your search:"
        input = gets.strip.downcase
        if input == "athlete"
            athlete_search
        elsif input == "affiliate"
            affiliate_search
        elsif input == "open workout"
            open_workout_search
        else
            puts "*Error: Please use one of the following commands to declare your search:",
            "*Error: ATHLETE, AFFILIATE, or OPEN WORKOUT ..."
            search_type
        end
    end
    
    def athlete_search
        puts "======== 2018 Crossfit Games Athlete Search ========",
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

    def athlete_information(athlete)
        puts "Athlete: #{athlete.titleize}",
        "Region:",
        "Affiliate:",
        "Age:",
        "Height:",
        "Weight:",
        ""
        exit
    end

    def affiliate_search
        puts "======== 2018 Crossfit Games Affiliate Search ========",
        "Please enter the affiliate that you would like to search for:"
        input = gets.strip.downcase
        if input.match(/\A[[:alpha:][:blank:]]+\z/) == nil
            puts "*Error: Please verify the affilate search entry."
            athlete_search
        else
            puts "Searching 2018 Leaderboard for #{input.titleize}'s' data..."
            affiliate_information(input)
        end
    end

    def affiliate_information(affilate)
        puts "Affiliate: #{affilate.titleize}",
        "1. Athlete_one",
        "2. Athlete_two",
        "3. Athlete_three",
        ""
        exit
    end

    def open_workout_search
        puts "======== 2018 Crossfit Games Open Workout Search ========",
        "2018 Crossfit Games Open Workouts",
        "18.1",
        "18.2",
        "18.3",
        "18.4",
        "18.5",
        "Enter workout(i.e. '18.1):"
        input = gets.strip
        if input == "18.1"
            puts "Complete as many rounds as possible in 20 minutes of:",
            "8 toes-to-bars",
            "10 dumbbell hang clean and jerks",
            "14-cal. row",
            "Men use 50-lb. dumbbell | Women use 35-lb. dumbbell"
        elsif input == "18.2"
            puts "1-2-3-4-5-6-7-8-9-10 reps for time of:",
            "Dumbbell squats",
            "Bar-facing burpees",
            "",
            "Men use 50-lb. dumbbells |Women use 35-lb. dumbbells",
            "",
            "Workout 18.2a",
            "",
            "1-rep-max clean",
            "",
            "Time cap: 12 minutes to complete 18.2 AND 18.2a"
        else
            "*Error: Please enter open workout in '18.#' format."
            open_workout_search 
        end
    end

    def open_workout_information(workout)
        puts "Affiliate: #{affilate.titleize}",
        "1. Athlete_one",
        "2. Athlete_two",
        "3. Athlete_three",
        ""
        exit
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
        end
    end

    
       
end 

class String  
    def titleize
      self.split(/ |\_/).map(&:capitalize).join(" ")
    end
end

class OpenWorkouts
open_workouts = {"workout_one" => ""}

end