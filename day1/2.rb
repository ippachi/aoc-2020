def main
  sorted_numbers = read_input
  sorted_numbers.each do |z|
    sorted_numbers.each do |s|
      next if z == s

      sorted_numbers.reverse_each do |e|
        if s + e + z == 2020
          puts s * e * z
          return
        end

        if s + e + z < 2020
          break
        end
      end
    end
  end
end

def read_input
  File.read('2.txt').split.map(&:to_i).sort
end

main
