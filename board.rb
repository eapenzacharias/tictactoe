class Board
  @matrix = [[3],[3],[3]]
  
  def clear
    @matrix = [[3],[3],[3]]
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
    col = (c%3)-1
    if c%3 == 0
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
    row = c/3
    col = (c % 3)-1
    if c % 3 == 0
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
end

puts "Row: #{row} Col: #{col} "