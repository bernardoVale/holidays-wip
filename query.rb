require 'json'

file = File.read('holidays_2016.json')


data = JSON.parse(file)



national_holidays = data["result"].select { |key, _| key["geographicType"] == "national" }

national_holidays.each do |holyday|
  puts holyday
end

puts national_holidays.length

bh_holidays = data["result"].select { |key, _| key["geographicType"] == "national" }