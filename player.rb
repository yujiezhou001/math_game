# require_relative './game'
class Player
    attr_accessor :minus_score
    attr_reader :score, name

    def initialize(name)
        @name = name
        @score = 3
    end

    def to_s
        @name
    end
    
    def minus_score
        @score -= 1
    end

    def lost?
        score <= 0
    end

end

