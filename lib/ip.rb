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
end

def num_to_ip(number)
  # TODO: return the string IP address from the `number`
end
