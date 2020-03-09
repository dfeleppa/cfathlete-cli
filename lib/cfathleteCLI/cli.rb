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
            affiliate_search
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
            puts "====== Crossfit Game Open Workout 18.1 ======",
            "Complete as many rounds as possible in 20 minutes of:",
            "8 toes-to-bars",
            "10 dumbbell hang clean and jerks",
            "14-cal. row",
            "Men use 50-lb. dumbbell | Women use 35-lb. dumbbell"
            open_leaderboard(input)
        elsif input == "18.2"
            puts "====== Crossfit Game Open Workout 18.2 ======",
            "1-2-3-4-5-6-7-8-9-10 reps for time of:",
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
            open_leaderboard(input)
        elsif input == "18.3"
            puts "====== Crossfit Game Open Workout 18.3 ======",
            "2 rounds for time of:",
            "100 double-unders",
            "20 overhead squats",
            "100 double-unders",
            "12 ring muscle-ups",
            "100 double-unders",
            "20 dumbbell snatches",
            "100 double-unders",
            "12 bar muscle-ups",
            "",
            "Men perform 115-lb. OHS, 50-lb. DB snatches,",
            "Women perform 80-lb. OHS, 35-lb. DB snatches",
            "",
            "Time cap: 14 minutes"
            open_leaderboard(input)
        elsif input == "18.4"
            puts "====== Crossfit Game Open Workout 18.4 ======",
            "For time:",
            "21 deadlifts, 225/155 lb.",
            "21 handstand push-ups",
            "15 deadlifts, 225/155 lb.",
            "15 handstand push-ups",
            "9 deadlifts, 225/155 lb.",
            "9 handstand push-ups",
            "21 deadlifts, 315/205 lb.",
            "50-ft. handstand walk",
            "15 deadlifts, 315/205 lb.",
            "50-ft. handstand walk",
            "9 deadlifts, 315/205 lb.",
            "50-ft. handstand walk",
            "",
            "Time cap: 9 min."
            open_leaderboard(input)
        elsif input == "18.5"
            puts "====== Crossfit Game Open Workout 18.5 ======",
            "Complete as many reps as possible in 7 minutes of:",
            "3 thrusters",
            "3 chest-to-bar pull-ups",
            "6 thrusters",
            "6 chest-to-bar pull-ups",
            "9 thrusters",
            "9 chest-to-bar pull-ups",
            "12 thrusters",
            "12 chest-to-bar pull-ups",
            "15 thrusters",
            "15 chest-to-bar pull-ups",
            "18 thrusters",
            "18 chest-to-bar pull-ups",
            "",
            "This is a timed workout. If you complete the round of 18, go on to 21.",
            "",
            "Men use 100 lb. | Women use 65 lb."
            open_leaderboard(input)
        else
            "*Error: Please enter open workout in '18.#' format."
            open_workout_search 
        end
    end

    def open_leaderboard(num)
        puts "",
        "Would you like to view the male or female leaderboard for #{num}?",
        "Please enter 'M' or 'F':"
        input = gets.strip.downcase
        if input == "m"
            puts "== 2018 Crossfit Games Open Workout #{num} Male Leaderboard ==",
            "Top 10:",
            "1. Athlete_one",
            "2. Athlete_two",
            "3. Athlete_three"
            exit
        elsif input == "f"
            puts "== 2018 Crossfit Games Open Workout #{num} Female Leaderboard ==",
            "Top 10:",
            "1. Athlete_one",
            "2. Athlete_two",
            "3. Athlete_three"
            exit
        else
            open_leaderboard(num)    
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
        end
    end

    
       
end 

class String  
    def titleize
      self.split(/ |\_/).map(&:capitalize).join(" ")
    end
end

class OpenWorkouts


end