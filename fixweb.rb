# require 'open-uri'
require 'nokogiri'

# Fix relative with absolute routes
my_heraldo = File.open('heraldo_origin.html').read
my_heraldo = my_heraldo.gsub("src=\"/","src=\"http://www.heraldo.es/")
my_heraldo = my_heraldo.gsub("href=\"/","href=\"http://www.heraldo.es/")

# Get data from first new
my_noked_heraldo = Nokogiri::HTML(my_heraldo)
title_to_change = my_noked_heraldo.xpath('//h2/a')[0].text
link_to_change = my_noked_heraldo.xpath('//h2/a/@href')[0]

# Switch my info
my_heraldo = my_heraldo.gsub(title_to_change,"Sesión de web scraping este jueves en #zaragozarb")
my_heraldo = my_heraldo.gsub(link_to_change,"http://www.marca.com")

# Rewrite with changes in another file
File.open("heraldo_new.html", "w") { |io|
	io.write(my_heraldo)
}

puts title_to_change