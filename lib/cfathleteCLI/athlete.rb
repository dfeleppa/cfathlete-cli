class CfathleteCLI::Athlete
    @@all = []
    attr_accessor   :rank, :name, :country, :affiliate_name, :gender, :age,
                    :height, :weight, :score

    def initialize(hash)
        
        hash.each {|key, value| self.send(("#{key}"), value)}
    end

    def self.all
        @@all
    end

    def self.first_name
        @first_name
    end

end

Athlete.new("Matt Fraser")
Athlete.first_name