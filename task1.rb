DIGITS_IN_A_ROW = 4

class String
	def numeric?
	  !(self =~ /[[:digit:]]/).nil?
	end
end

def multiply(row, start_index)
	result = 1
	start_index.upto(start_index + DIGITS_IN_A_ROW - 1) do |i|
		result *= row[i].to_i
	end
	result
end

def max_multiplication(row)
	current_position = 0
	result = nil
	while current_position < row.length - (DIGITS_IN_A_ROW - 1) do
		should_continue = true
		1.upto(DIGITS_IN_A_ROW) do |i|
			symbol = row[current_position - 1 + i]
			unless symbol.numeric?
				current_position += i
				should_continue = false
				break
			end
		end
		next unless should_continue
		current_result = multiply(row, current_position)
		result = current_result if result.nil? || current_result > result
		current_position += 1
	end
	result
end

puts max_multiplication('abc12345def')
puts max_multiplication('a1b2c3d4e').nil?