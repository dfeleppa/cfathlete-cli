class CfathleteCLI::API

    def self.get_athlete_by_rank(gen,num)
        url = "https://games.crossfit.com/competitions/api/v1/competitions/games/2019/leaderboards?division=#{gen}&region=0&scaled=0&sort=0&occupation=0&page=1"
        @athletes_hash = HTTParty.get(url)["leaderboardRows"]        
        @parsed_entrant = @athletes_hash.collect { |e| e["entrant"] }
        @parsed_score = @athletes_hash.collect { |e| e["overallScore"] }
        @parsed_rank = @athletes_hash.collect { |e| e["overallRank"] }
       
        rank_str = (num+1).to_s
        rank_int = (num+1).to_i        
        if (@parsed_rank.include?(rank_str)) || (@parsed_rank.include?(rank_int))
            athlete_obj = {
            rank: @parsed_rank[num],
            name: @parsed_entrant[num]["competitorName"],
            country: @parsed_entrant[num]["countryOfOriginName"],
            affiliate_name: @parsed_entrant[num]["affiliateName"],
            gender: @parsed_entrant[num]["gender"],
            age: @parsed_entrant[num]["age"],
            height: @parsed_entrant[num]["height"],
            weight: @parsed_entrant[num]["weight"],
            score: @parsed_score[num]
            }
            CfathleteCLI::Athlete.new(athlete_obj)          
        else
            puts "*Error: Rank does not exist, please ensure valid entry."
            CfathleteCLI::CLI.new.exit
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
                @entrant_match = e["entrant"]
            end
        end
            
        if @name_searched == nil
            puts "*Error: Name does not exist, please ensure valid entry."
                CfathleteCLI::CLI.new.exit
        else
            athlete_obj = {
            # rank: @parsed_rank[num],
            name: @entrant_match["competitorName"],
            country: @entrant_match["countryOfOriginName"],
            affiliate_name: @entrant_match["affiliateName"],
            gender: @entrant_match["gender"],
            age: @entrant_match["age"],
            height: @entrant_match["height"],
            weight: @entrant_match["weight"],
            # score: @parsed_score[num]
            }
            CfathleteCLI::Athlete.new(athlete_obj) 
        end
         
    end
    
end

 
