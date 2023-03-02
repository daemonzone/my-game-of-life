class Game
  include Enumerable
  
  def self.import(input_file)

    unless input_file.nil?

      line_size = 0
      rows = File.readlines(input_file.tempfile)

      rows.each_with_index do |row, idx|
        row_length = row.strip.length
        line_size = row_length if idx == 0
        # puts "#{idx}: #{row_length} <=> #{line_size}"
        raise 'Generation Matrix is not valid' if row_length != line_size
      end

      puts board_size = line_size * rows.size

      rows = rows.map {|r| r.strip }
      puts rows.join.ljust(board_size, '0')[0...board_size].chars.map{ |c| (c == '*' && 1 || 0) }

      # @cells = rows.join.ljust(board_size, '0')[0...board_size].chars.map(&valid_state)

      # puts @cells
    end # unless input_file.nil?

  end

  def generation
    @cells = cells.each_with_index.map do |cell, index|
      rules(cell_state: cell, neighbors_count: neighbors_count(index))
    end
    self
  end

  private

  def valid_state
    ->(char) { "Char: #{char}" }
  end

end