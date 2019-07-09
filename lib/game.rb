require_relative './board'
class Game
    def initialize
        @board = Board.new
        @turn_numbers = 0
        user_manuel
        game_controller
    end
    def user_manuel
        puts "\n"
        puts '*************************************************'
        puts '******** Welcome To My Tic-Tac-Toe Game! ********'
        puts '*************************************************'
        puts '================================================='
        puts '********************* RULES *********************'
        puts 'Two players will take turns to mark the spaces on'
        puts 'a 3x3 grid. The player who succeeds in placing 3 '
        puts 'of their marks in a horizontal, vertical, or     '
        puts 'diagonal row wins the game. When there are no    '
        puts 'more spaces left to mark, it is consider a draw. '
        puts 'To place a mark on the grid, type the number on  '
        puts 'the space you would like to mark! As shown below.'
        puts "Good luck! \n "
    end
    def turn player
        puts "Player #{player}'s Turn, choose a tile"
        @board.print_board
        input = gets.chomp.to_i
        while !@board.add(input,player)
            puts "Please enter a valid tile"
            input = gets.chomp.to_i
        end
        @turn_numbers+=1
        if @turn_numbers>4
            return @board.check(input,player)
        else
            return false
        end 
    end
    def game_controller
        current_player = 'x'
        wins = false
        while true
            if @turn_numbers == 9 || wins
                if wins
                    puts "\n"
                    puts '*************************************************'
                    puts '**************** CONGRATULATIONS ****************'
                    puts '*************************************************'
                    puts "**************** #{current_player} Player Wins! *****************"
                    puts '*************************************************'
                    @board.print_board
                    puts ""

                else
                    puts ""
                    puts '*************************************************'
                    puts '****************    GAME OVER    ****************'
                    puts '*************************************************'
                    puts "****************  It's a Draw!  *****************"
                    puts '*************************************************'
                    @board.print_board
                    puts ""
                end
                puts "Do you wanna keep playing? y/n"
                play = gets.chomp.downcase
                if play != 'y'
                    puts "Bye bye"
                    break
                else
                    @board.clear
                    @turn_numbers = 0
                end
            end
            if @turn_numbers%2 == 0
                current_player = 'x'
            else
                current_player = 'o'
            end
            wins = turn(current_player)
        end
    end
end
