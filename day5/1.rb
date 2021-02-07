max = 0
inputs = %w[
  BFFFBBFRRR
  FFFBBBFRRR
  BBFFBBFRLL
]
inputs = File.read('1.txt').split
list = []
inputs.each do |input|
  row_range = [0, 127]
  col_range = [0, 7]
  final_fb = ''
  final_lr = ''
  input.each_char do |char|
    case char
    when 'F'
      final_fb = 'F'
      row_range[1] = row_range[1] + ((row_range[0] - row_range[1]) / 2.0).floor
    when 'B'
      final_fb = 'B'
      row_range[0] = row_range[0] - ((row_range[0] - row_range[1]) / 2.0).floor
    when 'L'
      final_lr = 'L'
      col_range[1] = col_range[1] + ((col_range[0] - col_range[1]) / 2.0).floor
    when 'R'
      final_lr = 'R'
      col_range[0] = col_range[0] - ((col_range[0] - col_range[1]) / 2.0).floor
    end
  end

  row = if final_fb == 'F'
          row_range[0]
        else
          row_range[1]
        end

  col = if final_lr == 'L'
          col_range[0]
        else
          col_range[1]
        end

  list << row * 8 + col
end

me = []

list.sort.each_cons(2) do |x, y|
  me << x + 1 if y - x > 1
end

puts me
