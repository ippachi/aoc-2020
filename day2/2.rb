sum = 0
File.read('1.txt').split("\n").each do |line|
  range, char, password = line.split(' ')
  char = char[0]
  first, second = [range.split('-')[0].to_i - 1, range.split('-')[1].to_i - 1]
  if password[first] == char
    if password[second] == char
      next
    end

    sum += 1
  end

  if password[first] != char
    if password[second] == char
      sum += 1
    end
  end
end

puts sum
