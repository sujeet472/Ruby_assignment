def written_grade(num)
  if num<=0 
    return "Invalid input"
  
  elsif num>=1 && num<=5
    return "elementry"

  elsif num>=6 && num<=8
    return "middle school"

  elsif num>=9 && num<=12
    return "high school"
  else 
    return "college"
  end
end  
puts "Enter the grade : "

grade = gets.chomp.to_i

puts written_grade(grade)



