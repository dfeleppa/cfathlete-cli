class CfathleteCLI::Athlete
    @@all = []
    attr_accessor   :rank, :name, :country, :affiliate_name, :gender, :age,
                    :height, :weight, :score

    

    def initialize(hash)
        hash.each {|key, value| self.send(("#{key}="), value)}
        save
        display_data
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def display_data
        puts "Athlete: #{@name}",
        "Country: #{@country}",
        "Affiliate: #{@affiliate_name}",
        "Gender: #{@gender}",
        "Age: #{@age}",
        "Height: #{@height}",
        "Weight: #{@weight}",
        "",
        "2019 CrossFit Games Rank: #{@rank}, Overall Score: #{@score}",
        "*Please note that CrossFit adjusts ranks based on disqualifications."
        CfathleteCLI::CLI.new.exit
    end
end

