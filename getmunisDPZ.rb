require 'nokogiri'
require 'open-uri'

munis = []

for i in 1..15
	page = Nokogiri::HTML(open("http://www.dpz.es/municipios/fichamuni.asp?LocId=#{i}"))

	muni_res = page.xpath('//tr/td/p')
	muni_name = muni_res[1].text
	muni_phone = muni_res[9].text.strip.gsub("-","")
	muni_address = muni_res[7].text.strip

	munis << {muni_name => muni_phone}
	# munis << [muni_name, muni_phone, muni_address]
end

puts munis

