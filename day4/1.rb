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

input = inputs.first

inputs.each do |input|
  passport = input.split.each_with_object({}) { key, value = _1.split(':'); _2[key] = value }

  is_valid = passport['byr'].to_i.between?(1920, 2002) &&
          passport['iyr'].to_i.between?(2010, 2020) &&
          passport['eyr'].to_i.between?(2020, 2030) &&
          (if passport['hgt'].to_s[-2..-1] == 'cm'
             passport['hgt'].to_s[0..2].to_i.between?(150, 193)
           elsif passport['hgt'].to_s[-2..-1] == 'in'
             passport['hgt'].to_s[0..2].to_i.between?(59, 76)
           end) &&

          passport['hcl'].to_s.match?(/\A#([0-9]|[a-f]){6}\z/) &&
          %w[amb blu brn gry grn hzl oth].include?(passport['ecl']) &&
          passport['pid'].to_s.match?(/\A[0-9]{9}\z/)

  valid += 1 if is_valid
end

puts valid
