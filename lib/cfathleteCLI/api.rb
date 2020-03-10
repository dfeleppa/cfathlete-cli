class CfathleteCLI::API

    def self.get_athlete(gender, num)
        if gender == "male"
            url = "https://games.crossfit.com/competitions/api/v1/competitions/games/2019/leaderboards?division=1&region=0&scaled=0&sort=0&occupation=0&page=1"
        else
            url = "https://games.crossfit.com/competitions/api/v1/competitions/games/2019/leaderboards?division=2&region=0&scaled=0&sort=0&occupation=0&page=1"
        end
        get_athlete = HTTParty.get(url)
        @athletes_hash = get_athlete.parsed_response["leaderboardRows"]
        @parsed_entrant = @athletes_hash.collect { |e| e["entrant"] }
        @parsed_score = @athletes_hash.collect { |e| e["overallScore"] }

        athlete_name = @parsed_entrant[num]["competitorName"]
        athlete_country = @parsed_entrant[num]["countryOfOriginName"]
        athlete_affiliate_name = @parsed_entrant[num]["affiliateName"]
        athlete_gender = @parsed_entrant[num]["gender"]
        athlete_age = @parsed_entrant[num]["age"]
        athlete_height = @parsed_entrant[num]["height"]
        athlete_weight = @parsed_entrant[num]["weight"]

        athlete_score = @parsed_score[num]
        
        puts "Athlete: #{athlete_name}",
        "Country: #{athlete_country}",
        "Affiliate: #{athlete_affiliate_name}",
        "Gender: #{athlete_gender}",
        "Age: #{athlete_age}",
        "Height: #{athlete_height}",
        "Weight: #{athlete_weight}",
        "",
        "2019 CrossFit Games Rank: #{num}, Overall Score: #{athlete_score}"
    end

    # def diplay_athlete_data
    #     puts "Athlete: #{athlete_name}"

    # end
    
end

 
