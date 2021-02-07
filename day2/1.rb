sum = 0
File.read('1.txt').split("\n").each do |line|
  range, char, password = line.split(' ')
  range = (range.split('-')[0].to_i..range.split('-')[1].to_i)
  sum += 1 if range.include?(password.count(char))
end

puts sum
