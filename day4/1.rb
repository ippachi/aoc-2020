required = %w[
  byr
  iyr
  eyr
  hgt
  hcl
  ecl
  pid
]

inputs = File.read('1.txt').split("\n\n")

valid = 0

inputs.each do |input|
  valid += 1 if (required - input.split.map{ _1.split(':').first }).size == 0
end

puts valid
