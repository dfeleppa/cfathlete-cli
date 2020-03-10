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
            # puts "Athlete: #{athlete_obj[:name]}",
            # "Country: #{athlete_obj[:country]}",
            # "Affiliate: #{athlete_obj[:affiliate_name]}",
            # "Gender: #{athlete_obj[:gender]}",
            # "Age: #{athlete_obj[:age]}",
            # "Height: #{athlete_obj[:height]}",
            # "Weight: #{athlete_obj[:weight]}",
            # "",
            # "2019 CrossFit Games Rank: #{athlete_obj[:rank]}, Overall Score: #{athlete_obj[:score]}",
            # "*Please note that CrossFit adjusts ranks based on disqualifications."
            # CfathleteCLI::CLI.new.exit
            
        else
            puts "*Error: Rank search does not exit, please ensure valid entry."
            CfathleteCLI::CLI.new.exit
        end
    end
   
    
end

 
