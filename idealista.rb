require 'open-uri'
require 'nokogiri'

doc=Nokogiri::HTML(open("http://www.idealista.com/alquiler-oficinas/zaragoza/centro/paseo-independencia/"))

titles = doc.xpath("//li[@id][@class='adv ']")

titles.each_with_index do |item,index|
	puts item.xpath("//ul[@class='features']")[index].text +
		item.xpath("//div[@class='location']")[index].text +
		item.xpath("//div[@class='contact-phone-mail']")[index].text	
end
