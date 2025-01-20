# frozen_string_literal: true

# Write a program to display number is prime or not

def prime?(number)
  return false if number <= 1

  (2..Math.sqrt(number).to_i).each do |i|
    return false if (number % i).zero?
  end
  true
end

puts 'Enter a number:'
num = gets.to_i

if prime?(num)
  puts "#{num} is a prime number."
else
  puts "#{num} is not a prime number."
end
