def main
  sorted_numbers = read_input
  sorted_numbers.each do |s|
    sorted_numbers.reverse_each do |e|
      if s + e == 2020
        puts s * e
        return
      end

      if s + e < 2020
        break
      end
    end
  end
end

def read_input
  File.read('2.txt').split.map(&:to_i).sort
end

main
