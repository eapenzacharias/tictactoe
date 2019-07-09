class Board
  @matrix = Array.new
  def initialize
    @matrix = [[1,2,3],[4,5,6],[7,8,9]]
  end
  def add tile, value
    return false unless tile>0 && tile<10 
    row = tile/3
    col = (tile % 3)-1
    if tile % 3 == 0
      col = 2
      row -= 1
    end
    if @matrix[row][col] != 'x' && @matrix[row][col] != 'o'
      @matrix[row][col] = value
    else
      return false
    end
  end

  def clear
    @matrix = [[1,2,3],[4,5,6],[7,8,9]]
  end

  def check_row tile,value
    row = tile/3
    if tile%3 == 0
      row = row-1
    end
    for i in (0...3)
      return false if @matrix[row][i] != value
    end
    return true
  end
  
  def check_col tile,value
    col = (tile%3)-1
    if tile%3 == 0
      col = 2
    end
    for i in (0...3)
      return false if @matrix[i][col] != value
    end
    return true
  end
  
  def check_d value
    winL = true
    winR = true
    for i in (0...3)
      winL = false if @matrix[i][i] != value
      winR = false if @matrix[i][(2-i).abs] != value
    end
    return winL || winR
  end
  
  def check tile,value
    wins = false
    row = tile/3
    col = (tile % 3)-1
    if tile % 3 == 0
      col = 2
      row -= 1
    end
    if tile == 5 || ( col % 2 == 0 && row % 2 == 0 )
      wins ||= check_col tile,value
      wins ||= check_row tile,value
      wins ||= check_d value
    else
      wins ||= check_col tile,value
      wins ||= check_row tile,value
    end
    return wins
  end

  def print_board

    puts '-------------'
    puts "| #{@matrix[0][0]} | #{@matrix[0][1]} | #{@matrix[0][2]} |"
    puts '|---+---+---|'
    puts "| #{@matrix[1][0]} | #{@matrix[1][1]} | #{@matrix[1][2]} |"
    puts '|---+---+---|'
    puts "| #{@matrix[2][0]} | #{@matrix[2][1]} | #{@matrix[2][2]} |"
    puts '-------------'
    puts ""
  end
  private :check_row, :check_col ,:check_d
end
