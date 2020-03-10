class CfathleteCLI::API
attr_accessor :athlete_rank, :athlete_name,:athlete_country, :athlete_affiliate_name,
:athlete_gender, :athlete_age, :athlete_height, :athlete_weight, :athlete_score

    def self.get_athlete_by_rank(gender,num)
        if gender == "male"
            url = "https://games.crossfit.com/competitions/api/v1/competitions/games/2019/leaderboards?division=1&region=0&scaled=0&sort=0&occupation=0&page=1"
        else
            url = "https://games.crossfit.com/competitions/api/v1/competitions/games/2019/leaderboards?division=2&region=0&scaled=0&sort=0&occupation=0&page=1"
        end
        get_athlete = HTTParty.get(url)
        @athletes_hash = get_athlete.parsed_response["leaderboardRows"]
        @parsed_entrant = @athletes_hash.collect { |e| e["entrant"] }
        @parsed_score = @athletes_hash.collect { |e| e["overallScore"] }
        @parsed_rank = @athletes_hash.collect { |e| e["overallRank"] }
              
        rank_str = (num+1).to_s

        if @parsed_rank.include?(rank_str)
            @athlete_rank = @parsed_rank[num]
            @athlete_name = @parsed_entrant[num]["competitorName"]
            @athlete_country = @parsed_entrant[num]["countryOfOriginName"]
            @athlete_affiliate_name = @parsed_entrant[num]["affiliateName"]
            @athlete_gender = @parsed_entrant[num]["gender"]
            @athlete_age = @parsed_entrant[num]["age"]
            @athlete_height = @parsed_entrant[num]["height"]
            @athlete_weight = @parsed_entrant[num]["weight"]
            @athlete_score = @parsed_score[num]
            puts "Athlete: #{@athlete_name}",
            "Country: #{@athlete_country}",
            "Affiliate: #{@athlete_affiliate_name}",
            "Gender: #{@athlete_gender}",
            "Age: #{@athlete_age}",
            "Height: #{@athlete_height}",
            "Weight: #{@athlete_weight}",
            "",
            "2019 CrossFit Games Rank: #{@athlete_rank}, Overall Score: #{@athlete_score}"
            CfathleteCLI::CLI.new.exit
            # diplay_athlete.new(num)
        else
            puts "*Error: Rank search does not exit, please ensure valid entry."
            CfathleteCLI::CLI.new.exit
        end
    end

    
    # def diplay_athlete(num)
    #     @athlete_rank = @parsed_rank[num]
    #     @athlete_name = @parsed_entrant[num]["competitorName"]
    #     @athlete_country = @parsed_entrant[num]["countryOfOriginName"]
    #     @athlete_affiliate_name = @parsed_entrant[num]["affiliateName"]
    #     @athlete_gender = @parsed_entrant[num]["gender"]
    #     @athlete_age = @parsed_entrant[num]["age"]
    #     @athlete_height = @parsed_entrant[num]["height"]
    #     @athlete_weight = @parsed_entrant[num]["weight"]
    #     @athlete_score = @parsed_score[num]
    #     puts "Athlete: #{@athlete_name}",
    #     "Country: #{@athlete_country}",
    #     "Affiliate: #{@athlete_affiliate_name}",
    #     "Gender: #{@athlete_gender}",
    #     "Age: #{@athlete_age}",
    #     "Height: #{@athlete_height}",
    #     "Weight: #{@athlete_weight}",
    #     "",
    #     "2019 CrossFit Games Rank: #{@athlete_rank}, Overall Score: #{@athlete_score}"
    #     CfathleteCLI::CLI.new.exit
    # end
    
end

 
