def ip_to_num(ip_address)
  # TODO: return the number version of the `ip_address` string

array = []
ip_array = []
bits_array = [128, 64, 32, 16, 8, 4, 2, 1,]
ip_number = ""
binary_array = []
final_number = 0

# Saparete the ip numbers
ip_address.each_char.with_index do |char, index|
  if char != "."
    array << char
  end
  if char == "." || index == ip_address.length - 1
    ip_number = array.join('')
    ip_array << ip_number.to_i
    ip_number = ""
    array.clear
  end
end

# Transform the ip in binary
for c in ip_array do
  sub_number = c
  for current in bits_array do
    if sub_number < current
    binary_array << 0
    elsif sub_number >= current
      binary_array << 1
      sub_number -= current
    end
  end
end


# Calculating the final number
binary_array.reverse!

binary_array.each.with_index do |current, index|
  if current == 1
    final_number += 2 ** index
  end
end

return final_number

end

def num_to_ip(number)
  # TODO: return the string IP address from the `number`

final_number = number
binary_array = []
bits_array = [128, 64, 32, 16, 8, 4, 2, 1,]
sum = 0
current_number = ""
ip_array = []

# An array to do the potentiation
array = (0..31).reverse_each.to_a

# Tranform the number in binary
array.each do |c|
  if final_number < 2 ** c
    binary_array << 0
  elsif final_number >= 2 ** c
    binary_array << 1
    final_number -= 2 ** c
  elsif final_number == 0
    binary_array << 0
    end
end

# Separete the binary number in 4 blocks of 8 characteres
binary_bits_array_of_arrays = binary_array.each_slice(8).to_a

# Transform the Binary number in an ip number
binary_bits_array_of_arrays.each do |arra|
  if current_number.length <= 0
    current_number = arra.join
    current_number.each_char.with_index do |c, i|
      bits_array.each.with_index do |current, index|
        if c == "1" && i == index
          sum += current
        end
        if i == 7 && index == 7
          ip_array << sum
          sum = 0
          current_number = ""
        end
      end
    end
  end
end

ip = ip_array.join(".")


return ip
end


# Tests
puts ip_to_num("37.160.113.170") # Should return 631271850
puts num_to_ip(631271850) # Should return "37.160.113.170"

puts ip_to_num("192.168.1.100") # Should return 3232235876
puts num_to_ip(3232235876) # Should return "192.168.1.100"

puts ip_to_num("10.0.0.2") # Should return 167772162
puts num_to_ip(167772162) # Should return "10.0.0.2"

puts ip_to_num("172.16.254.1") # Should return 167772162
puts num_to_ip(2886794753) # Should return "172.16.254.1"

puts ip_to_num("8.8.8.8") # Should return 134744072
puts num_to_ip(134744072) # Should return "8.8.8.8"
