# Assignment -

# Try out different examples on above topics by their own on ruby
# console
# Continue the above assignment if they can use the above
# concepts in it.


require 'singleton'


class CountryBase
  attr_accessor :country_name, :population, :gdp, :states, :army_strength, :status_of_country

  def initialize(country_name, population, gdp, states, army_strength, status_of_country)
    puts "Country status initialized"
    @country_name = country_name
    @population = population
    @gdp = gdp
    @states = states
    @army_strength = army_strength
    @status_of_country = status_of_country
  end

  def display
    puts "Country name      : #{country_name}"
    puts "Population        : #{population}"
    puts "GDP              : #{gdp}"
    puts "Number of states : #{states}"
    puts "Army strength    : #{army_strength}"
    puts "Status           : #{status_of_country}"
  end
end

class CountryPresentStatus < CountryBase
  def loan_by_imf?
    @gdp < 200_000 && @status_of_country == 'developing'
  end

  def loan_by_wb?
    @gdp < 500_000 && @status_of_country == 'developing'
  end

  def united_nations_seat?
    @gdp > 1_000_000 && @army_strength > 500_000
  end

  def war_win?
    @army_strength > 300_000
  end
end


class CountryAnalyzer
  include Singleton

  def analyze(country)
    country.display
    puts country.loan_by_imf? ? "Eligible for IMF loan" : "Not eligible for IMF loan"
    puts country.loan_by_wb? ? "Eligible for WB (World Bank loan)" : "Not eligible for WB (World Bank loan)"
    puts country.united_nations_seat? ? "Eligible for United Nations Seat" : "Not eligible for United Nations Seat"
    puts country.war_win? ? "It can win war" : "It cannot win war"
  end
end


puts "Enter country name"
country_name = gets.chomp

puts "Enter population"
population = gets.chomp.to_i

puts "Enter GDP of country:"
gdp = gets.chomp.to_i

puts "Enter number of states:"
states = gets.chomp.to_i

puts "Enter Army strength:"
army_strength = gets.chomp.to_i

puts "Enter status of country (developed/developing):"
status_of_country = gets.chomp


country = CountryPresentStatus.new(country_name, population, gdp, states, army_strength, status_of_country)
puts "_____________________________________"


CountryAnalyzer.instance.analyze(country)
