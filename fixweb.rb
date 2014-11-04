# require 'open-uri'
require 'nokogiri'

# Fix relative with absolute routes
my_heraldo = File.open('heraldo-origin.html').read
my_heraldo = my_heraldo.gsub("src=\"/","src=\"http://www.heraldo.es/")
my_heraldo = my_heraldo.gsub("href=\"/","href=\"http://www.heraldo.es/")
# videos
my_heraldo = my_heraldo.gsub("data=\"/","data=\"http://www.heraldo.es/")
my_heraldo = my_heraldo.gsub("\"/uploads","\"http://www.heraldo.es/uploads")
my_heraldo = my_heraldo.gsub("\"/MODULOS","\"http://www.heraldo.es/MODULOS")


# Get data from first new
my_noked_heraldo = Nokogiri::HTML(my_heraldo)
title_to_change = my_noked_heraldo.xpath('//h2/a')[0].text
link_to_change = my_noked_heraldo.xpath('//h2/a/@href')[0]
pre_title = my_noked_heraldo.xpath('//div/div/div/div/div/strong')[0].text
author = my_noked_heraldo.xpath('//div/div/p/span')[0].text
subtext = my_noked_heraldo.xpath('//div/div/div/div/div/div/div')[0].text

# sometimes there is an image
image_to_change = my_noked_heraldo.xpath('//img[@data-original]')[0]
link_image = my_noked_heraldo.xpath('//img[@data-original]/..')[0]
#title_to_change = my_noked_heraldo.xpath('//img[@data-original]/../../../h2/a')[0]
#alt_image_to_change = my_noked_heraldo.xpath('//div/div/a/img/@alt')[0]

# Policy
policy_to_change = my_noked_heraldo.xpath('//div[@id="pie"]//p')[2]


# Switch with my own data
my_heraldo = my_heraldo.gsub(title_to_change,"Sesi&oacute;n de web scraping este jueves en #zaragozarb")
my_heraldo = my_heraldo.gsub(link_to_change,"http://www.meetup.com/Zaragoza-Ruby-Jam-Sessions/events/215246072/")
my_heraldo = my_heraldo.gsub(pre_title,"Evento de programaci&oacute;n en Zaragoza")
my_heraldo = my_heraldo.gsub(author,"Efe. Zaragoza")
my_heraldo = my_heraldo.gsub(subtext,"Esta tarde se explicar&aacute; el uso de la gema Nokogiri, en La Jamoner&iacute;a")

# Image
my_heraldo = my_heraldo.gsub(image_to_change['data-original'],"http://photos4.meetupstatic.com/photos/event/4/9/5/e/600_226578782.jpeg")
my_heraldo = my_heraldo.gsub(link_image['href'],"http://www.meetup.com/Zaragoza-Ruby-Jam-Sessions/events/215246072/")
#my_heraldo = my_heraldo.gsub(alt_image_to_change,"Sesión de web scraping este jueves en #zaragozarb")

# Policy
my_heraldo = my_heraldo.gsub(policy_to_change,policy_to_change.to_s + "<p>Extra&iacute;do de Heraldo de Arag&oacute;n (2014).
	Esta p&aacute;gina ha sido replicada con fines docentes a los efectos del art&iacute;culo 32.1, p&aacute;rrafo primero, de la Ley de Propiedad Intelectual. 
	Recuperado en octubre de 2014 de <a href=\"http://www.heraldo.es\" style=\"color:#f9ffff\">www.heraldo.es</a></p>")
# my_heraldo = my_heraldo.gsub(subtext,"Esta tarde se explicará el uso de la gema Nokogiri, en La Jamonería")

# Rewrite with changes in another file
File.open("heraldo-final.html", "w") { |io|
	io.write(my_heraldo)
}

# puts pre_title
# puts subtext
# puts title_to_change
puts image_to_change['data-original'].to_s

# puts policy_to_change.to_s.length
