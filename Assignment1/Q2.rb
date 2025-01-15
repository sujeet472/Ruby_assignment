# WAP for students to print their school level according to grade
# e.g -
# if grade is between 1-5 return elementary
# if grade is between 6-8 return middle school
# if grade is between 9-12 return high school
# if grade is between otherwise return college




def school_level(num)

  case num

  when ..0
    "Invalid input"
  
  when 1..5
    "elementry"

  when 6..8
    "middle school" 

  when 9..12
    "high school"

  else 
    "college"
  end

end  
puts "Enter the grade : "

grade = gets.chomp.to_i

puts school_level(grade)



#   ------------------OLDER VERSION OF CODE-----------------

# def written_grade(num)
#   if num<=0 
#     return "Invalid input"
  
#   elsif num>=1 && num<=5
#     return "elementry"

#   elsif num>=6 && num<=8
#     return "middle school"

#   elsif num>=9 && num<=12
#     return "high school"
#   else 
#     return "college"
#   end
# end  
# puts "Enter the grade : "

# grade = gets.chomp.to_i

# puts written_grade(grade)



