# @type [Array<String>]
field = File.read('1.txt').split("\n")

x_size = field.first.size
y_size = field.size

results = []

[
  [1,1],
  [3,1],
  [5,1],
  [7,1],
  [1,2]
].each do |x_delta, y_delta|
  x, y = [0, 0]

  tree_num = 0

  loop do
    x += x_delta
    y += y_delta

    break if y > y_size - 1

    tree_num += 1 if field[y][x % x_size] == "#"
  end

  results << tree_num
end

puts results.inject(&:*)
