require_relative './player'
require_relative './turn'

class Game
    def initialize
        @player1 = Player.new 'Player 1'
        @player2 = Player.new 'Player 2'
        @players = [@player1, @player2]
        @shuffled_arr = Turn.new(@players)
    end

    def number
        rand(1..20)
    end

    def ask_question
        # puts status
        # number1 = number
        # number2 = number
        # total = number1 + number2
        # puts "Player 1: What does #{number1} + #{number2} equal?"
        # print "> "
        # answer = $stdin.gets.chomp.to_i
        # if  total == answer
        #     puts "YES! You are correct."
        # else
        #     puts "Seriously? No!"
        #     @player1.minus_score
        # end
    end

    def run
        until (game_over?) do
            players = @shuffled_arr
            current = players.get_current_player
            number1 = number
            number2 = number
            total = number1 + number2
            puts "#{current}: What does #{number1} + #{number2} equal?"
            print "> "
            answer = $stdin.gets.chomp.to_i
            if  total == answer
                puts "#{current}: YES! You are correct."
                puts status
                break if game_over?
                puts "------ NEW TURN ------"
            else
                puts "#{current}: Seriously? No!"
                current.minus_score
                puts status
                break if game_over?
                puts "------ NEW TURN ------"
            end
            @shuffled_arr.take_turns
        end
        end_game
    end

    def winner
        @players.find{|player| !player.lost?}
    end

    def status
        puts "P1: #{@player1.score}/3 vs P2: #{@player2.score}/3"
    end

    def game_over?
        @players.select{|player| !player.lost?}.count == 1
    end

    def end_game
        puts "#{winner} wins with a score of #{winner.score}/3"
        puts "------- GAME OVER -------"
        puts "Good bye!"
    end

end