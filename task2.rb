def get_amount_of_ones(number)
  count = 0
  binary_number = number.to_s(2)
  0.upto(binary_number.length - 1) do |i|
    count += 1 if binary_number[i] == "1"
  end
  count
end

def sort(array)
  hash = {}
  count_of_repetions = Hash.new(0)
  for number in array 
    hash[number] = get_amount_of_ones(number)
    count_of_repetions[number] += 1
  end
  hash = hash.sort_by {|key, value| [value, key]}.to_h
  result = []
  for number in hash.keys
    count_of_repetions[number].times { result << number }
  end
  result
end

p sort([3,7,8,9])
p sort([9,7,7,8,3])
