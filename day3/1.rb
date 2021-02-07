# @type [Array<String>]
field = File.read('1.txt').split("\n")

x_size = field.first.size
y_size = field.size

x, y = [0, 0]

tree_num = 0

loop do
  x += 3
  y += 1

  break if y > y_size - 1

  tree_num += 1 if field[y][x % x_size] == "#"
end

puts tree_num
