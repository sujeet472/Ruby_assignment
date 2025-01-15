# Question : Write a program to find IP address class.






def find_ip_class(ip)
  # Split the IP address into its octets
  first_octet = ip.split('.')[0].to_i

  # Determine the class based on the first octet
  case first_octet
  when 1..127
    "Class A"
  when 128..191
    "Class B"
  when 192..223
    "Class C"
  when 224..239
    "Class D (Multicast)"
  when 240..255
    "Class E (Experimental)"
  else
    "Invalid IP address"
  end
end

# Input and output
puts "Enter an IP address:"
ip_address = gets.chomp
puts find_ip_class(ip_address)

