class CfathleteCLI::Athlete
    attr_reader :region, :affiliate, :age,
                :height, :weight
    attr_accessor :name, :first_name, :last_name
    @@all = []

    def initialize(name)
        @first_name = name.split(" ")[0]
        @last_name = name.split(" ")[1]
    end

    def self.all
    end

    def self.first_name
        @first_name
    end

end

Athlete.new("Matt Fraser")
Athlete.first_name