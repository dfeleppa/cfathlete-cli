class CfathleteCLI::API
    
    def self.get_athlete_by_rank(gen,num)
        url = "https://games.crossfit.com/competitions/api/v1/competitions/games/2019/leaderboards?division=#{gen}&region=0&scaled=0&sort=0&occupation=0&page=1"
        @athletes_hash = HTTParty.get(url)["leaderboardRows"]        
        @parsed_entrant = @athletes_hash.collect { |e| e["entrant"] }
        @parsed_score = @athletes_hash.collect { |e| e["overallScore"] }
        @parsed_rank = @athletes_hash.collect { |e| e["overallRank"] }
        
        @rank_search = @athletes_hash.each do |e| 
            if e["overallRank"].to_i == num 
                @rank_searched = e["overallRank"]
                @entrant_match = e
            end
        end
            if @rank_searched == nil
                puts "*Error: Rank does not exist, please ensure valid entry."
                    CfathleteCLI::CLI.new.exit
            else
                athlete_obj = {
                rank: @entrant_match["overallRank"],
                name: @entrant_match["entrant"]["competitorName"],
                country: @entrant_match["entrant"]["countryOfOriginName"],
                affiliate_name: @entrant_match["entrant"]["affiliateName"],
                gender: @entrant_match["entrant"]["gender"],
                age: @entrant_match["entrant"]["age"],
                height: @entrant_match["entrant"]["height"],
                weight: @entrant_match["entrant"]["weight"],
                score: @entrant_match["overallScore"]
                }
                CfathleteCLI::Athlete.new(athlete_obj) 
            end
    end
    def self.get_athlete_by_name(gen,name)
        url = "https://games.crossfit.com/competitions/api/v1/competitions/games/2019/leaderboards?division=#{gen}&region=0&scaled=0&sort=0&occupation=0&page=1"
        @athletes_hash = HTTParty.get(url)["leaderboardRows"]        
        @parsed_entrant = @athletes_hash.collect { |e| e["entrant"] }
        @parsed_score = @athletes_hash.collect { |e| e["overallScore"] }
        @parsed_rank = @athletes_hash.collect { |e| e["overallRank"] }
        
        @name_search = @athletes_hash.each do |e| 
            if e["entrant"]["competitorName"].strip.downcase == name
                @name_searched = e["entrant"]["competitorName"]
                @entrant_match = e
            end
        end
            
        if @name_searched == nil
            puts "*Error: Name does not exist, please ensure valid entry."
                CfathleteCLI::CLI.new.exit
        else
            athlete_obj = {
            rank: @entrant_match["overallRank"],
            name: @entrant_match["entrant"]["competitorName"],
            country: @entrant_match["entrant"]["countryOfOriginName"],
            affiliate_name: @entrant_match["entrant"]["affiliateName"],
            gender: @entrant_match["entrant"]["gender"],
            age: @entrant_match["entrant"]["age"],
            height: @entrant_match["entrant"]["height"],
            weight: @entrant_match["entrant"]["weight"],
            score: @entrant_match["overallScore"]
            }
            CfathleteCLI::Athlete.new(athlete_obj) 
        end
    end
    
    def self.view_all_by_rank(gen)
        
        url = "https://games.crossfit.com/competitions/api/v1/competitions/games/2019/leaderboards?division=#{gen}&region=0&scaled=0&sort=0&occupation=0&page=1"
        @athletes_hash = HTTParty.get(url)["leaderboardRows"]
               
        @ranked_list = @athletes_hash.collect {|e|
            name = e["entrant"]["competitorName"]
            score = e["overallRank"]
            @ranked_list = [name, score]         
        }
        
        x = 0
        y = 19
        while x < y
            if y < @ranked_list.length
                @ranked_list_test = @ranked_list[x..y]
                @ranked_list_test.each { |key,value|
                puts "#{value}. #{key}" }
                x += 20
                puts "",
                "View more ? (Y/N)"
                input = gets.strip.downcase
                if input == "y"
                    y += 20
                elsif input == "n"
                    CfathleteCLI::CLI.new.exit
                else
                    puts "Please type 'Y' or 'N'."
                    self.view_all_by_rank(gen)
                end
            else
                @ranked_list_test = @ranked_list[x..y]
                @ranked_list_test.each { |key,value|
                puts "#{value}. #{key}" }
                CfathleteCLI::CLI.new.exit
                x += 99
            end
        end
        
    end
end