require 'net/http'

system("cls || clear")
puts "API version: v2"
puts "by martin3lli"
puts "   .----."
puts "   |C>_ |"
puts " __|____|__"
puts "|  ______--|"
puts "`-/.::::.\-'a"
puts " `--------'\n\n"
print "IP: "
resp = gets.chomp
if(resp == "")
    print "Coloque o IP de alguma database"
    return;
end
url_ip = URI("http://api.db-ip.com/v2/free/#{resp}/ipAddress")
ip_response = Net::HTTP.get(url_ip);
url_continent = URI("http://api.db-ip.com/v2/free/#{resp}/continentName")
continent_response = Net::HTTP.get(url_continent);
conuntry_ip = URI("http://api.db-ip.com/v2/free/#{resp}/countryCode")
country_response = Net::HTTP.get(conuntry_ip);
url_prov = URI("http://api.db-ip.com/v2/free/#{resp}/stateProv")
prov_response = Net::HTTP.get(url_prov);
url_city = URI("http://api.db-ip.com/v2/free/#{resp}/city")
city_response = Net::HTTP.get(url_city);

if continent_response.include?("INVALID_ADDRESS")
    puts "DataBase com o ip '#{resp}' não é existente."
    return;
end

if(city_response == "")
    city_response = "?"
end

if(continent_response == "")
    continent_response = "?"
end

if(country_response == "")
    country_response = "?"
end

if(prov_response == "")
    prov_response = "?"
end

print "\nContinente: #{continent_response}"
print "\nPaís: #{country_response}"
print "\nProvincia: #{prov_response}"
print "\nCidade: #{city_response}\n\n\n"
