# frozen_string_literal: true

# Question : Print a-z in reverse order

# Tried to use ASCII vlaue to print the output

# x=122

# for a in 0..25 do
#  puts (x-a).chr

# end

122.downto(97).each { |var|; puts var.chr; } # Range works in ascending order hence used .downto method
