# PFB the assignment for today:

# Assignment - 
#     A CLI application for handling data of as many countries as we can. Example of what data that we can have:
# Population
# GDP(Gross Domestic Production)
# States
# Army Strength
# State of country(developing, developed)
# Etc.
# On the basis of all these data we will be building modules to conceive various outputs like:
# Whether that country will get a loan from the IMF (International Monetary Fund) or WB (World bank).
# Whether the country can have a seat in the UN (United Nations) Security council.
# Whether the country can win the war or not




module Loan_check

    def loan_by_imf?
      @gdp < 200_000 && @status_of_country == 'developing'
    end
  
  
    def loan_by_wb?
      @gdp < 500_000 && @status_of_country == 'developing'
    end
  
  end
  
  
  module United_nations_seat_check
  
    def united_nations_seat?
      @gdp > 1_000_000 && @army_strength > 500_000
    end
  
  end
  
  
  module War_win_check
  
  
    def war_win?
      @army_strength > 300_000
    end
  
  end
  
  
  
  class Allchecks
  
  
    include Loan_check
    include United_nations_seat_check
    include War_win_check
  
  
  
    attr_accessor :country_name , :population , :gdp , :states , :army_strength , :status_of_country
  
  
    def initialize(country_name, population, gdp, states, army_strength, status_of_country)
      puts "Allchecks classes initialsed"
      @country_name= country_name
      @population = population
      @gdp = gdp
      @states = states
      @army_strength = army_strength
      @status_of_country = status_of_country
    end
  
    def display
      puts "Cuntry name : #{country_name}"
      puts "Population is : #{population}"
      puts "GDP is : #{gdp}"
      puts "No. of states are : #{states}"
      puts "Army strength is : #{army_strength}"
      puts "Status of country is : #{status_of_country}"
    end
  
    def analyze
      display
      puts loan_by_imf? ? "Eligible for IMF loan" : "Not eligile for IMF loan"
      puts loan_by_wb? ? "Eligible for WB(world bank loan)" : "Not eligible for WB(world bank loan)"
      puts united_nations_seat? ? "Eligible for United Nations Seat" : "Not eligibl for United Nations Seat"
      puts war_win? ? "It can win war" : "It cannot win war"
    end
  
  end
  
  
  
  puts "Enter country name"
  country_name = gets.chomp
  
  puts "Enter population"
  population = gets.chomp.to_i
  
  puts "Enter GDP of country :"
  gdp = gets.chomp.to_i
  
  puts "Enter number of states : "
  states = gets.chomp.to_i
  
  puts "Enter Army strength :"
  army_strength = gets.chomp.to_i
  
  puts "Enter status of country (developed/developing) :"
  status_of_country = gets.chomp
  
  
  
#   country1 = Allchecks.new('INDIA',12346789,100_000,28,1046476,'developing')
  country2 = Allchecks.new(country_name, population, gdp, states, army_strength, status_of_country)
  
  
#   country1.analyze
  puts "_____________________________________"
  
  country2.analyze
  
  
  
  
  