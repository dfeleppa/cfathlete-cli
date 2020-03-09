class CfathleteCLI::API

    def self.get_athlete
        @athletes_hash = HTTParty.get("https://games.crossfit.com/competitions/api/v1/competitions/open/2018/leaderboards?division=1&region=0&scaled=0&sort=0&occupation=0&page=1")
        binding.pry
    end

    
end