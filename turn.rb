class Turn

    attr_accessor :take_turns
    attr_reader :get_current_player, :get_opposite_player

    def initialize(players)
        @players_arr = players.shuffle
        @round = 0
        @current_player = nil
    end

    def get_current_player
        @players_arr[0]
    end

    def get_opposite_player
        @players_arr[1]
    end

    def take_turns
        @players_arr = @players_arr.rotate
    end
    
end
