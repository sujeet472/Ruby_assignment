# Question : Regex for mobile number, email address, name, gender(M / F) and amount



mobile_number_regex = /^[0-9]{10}$/


email_regex = /^[a-zA-Z0-9.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$/


name_regex = /^[A-Za-z ]+$/


gender_regex = /^[MF]$/


amount_regex = /^\₹?\d+(\.\d{2})?$/


mobile_number = "1234567890"
email = "example@domain.com"
name = "John Doe"
gender = "M"
amount = "₹123.45"


def validate_input(input, regex, field_name)
  if input.match?(regex)
    puts "#{field_name} is valid."
  else
    puts "#{field_name} is invalid."
  end
end


validate_input(mobile_number, mobile_number_regex, "Mobile Number")
validate_input(email, email_regex, "Email Address")
validate_input(name, name_regex, "Name")
validate_input(gender, gender_regex, "Gender")
validate_input(amount, amount_regex, "Amount")

