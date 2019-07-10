require_relative './board'
class Game
    def initialize prev_board = Board.new, prev_names = Hash.new, prev_turns = 0
        @names_and_symbols = prev_names
        @board = prev_board
        @turn_numbers = prev_turns
        if @turn_numbers == 0
            user_manuel
            game_controller
        end
    end
    def user_manuel
        puts "\n"
        puts '*************************************************'
        puts '******** Welcome To My Tic-Tac-Toe Game! ********'
        puts '*************************************************'
        puts '================================================='
        puts '********************* RULES *********************'
        puts 'Two players will set_player_modeake turns to mark the spaces on'
        puts 'a 3x3 grid. The pset_player_modeayer who succeeds in placing 3 '
        puts 'of their marks inset_player_modea horizontal, vertical, or     '
        puts 'diagonal row winsset_player_modethe game. When there are no    '
        puts 'more spaces left to mark, it is consider a draw. '
        puts 'To place a mark on the grid, type the number on  '
        puts 'the space you would like to mark! As shown below.'
        puts "Good luck! \n "
        puts "Please enter the name of Player #1: "
        name1 = gets.chomp
        puts "Please enter the name of Player #2: "
        name2 = gets.chomp  
        puts "#{name1} choose: x/o "
        result = gets.chomp
        if result.downcase == 'o'
            @names_and_symbols[:o] = name1
            @names_and_symbols[:x] = name2
        else
            @names_and_symbols[:o] = name2
            @names_and_symbols[:x] = name1
        end
        puts ''
    end
    def turn player
        puts "#{@names_and_symbols[player]}'s Turn, choose a tile"
        @board.print_board
        input = gets.chomp.to_i
        while !@board.add(input,player.to_s)
            puts "Please enter a valid tile"
            input = gets.chomp.to_i
        end
        @turn_numbers+=1
        if @turn_numbers>4
            return @board.check(input,player.to_s)
        else
            return false
        end 
    end
    def game_controller
        current_player = :x
        wins = false
        while true
            if @turn_numbers == 9 || wins
                if wins
                    t = (50-(1+@names_and_symbols[current_player].length+7))/2
                    puts "\n"
                    puts '*************************************************'
                    puts '**************** CONGRATULATIONS ****************'
                    puts '*************************************************'
                    t.times{ print '*'}
                    print " #{@names_and_symbols[current_player]} Wins! "
                    if @names_and_symbols[current_player].length % 2 == 0
                        (t-1).times{ print '*'}
                    else 
                        (t).times{ print '*'}
                    end
                    puts "\n*************************************************"
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
                current_player = :x
            else
                current_player = :o
            end
            wins = turn(current_player)
        end
    end
end
