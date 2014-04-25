require 'nokogiri'
require 'open-uri'

munis = []

for i in 1..15
	page = Nokogiri::HTML(open("http://www.dpz.es/municipios/fichamuni.asp?LocId=#{i}"))

	muni_name = page.xpath('//tr/td/p')[1].text
	muni_phone = page.xpath('//tr/td/p')[9].text.strip.gsub("-","")
	muni_address = page.xpath('//tr/td/p')[7].text.strip

	munis << {muni_name => muni_phone}
	# munis << [muni_name, muni_phone, muni_address]
end

puts munis

