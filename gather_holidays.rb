require 'net/http'
require 'json'

get_title = Proc.new { |data| data.each { |holiday| puts holiday['title'] } }

def parse_json(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

def print_holidays(year)
  urls = %w(http://dadosbr.github.io/feriados/nacionais.json http://dadosbr.github.io/feriados/estaduais/MG.json)

  data = []
  urls.each do |url|

    aux = parse_json(url)

    #Normalizing
    aux.each do |holiday|
      holiday['date'] = holiday['variableDates'][String(year)] if holiday['variableDates'] != {}
      data << holiday
    end

  end
  data.sort_by! {|k| Date(k['date']) }
  puts data
end

print_holidays 2016
print_holidays 2017


#urls.each { |url| get_title.call parse_json(url) }



# Get National/State Holydays from dadosbr


#http://dadosbr.github.io/feriados/estaduais/MG.json

# Need something to gather municipal holydays

# Gather US Holidays