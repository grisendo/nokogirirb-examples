require 'open-uri'

open('heraldo-origin.html','w') do |file|
	open('http://www.heraldo.es') do |web|
		file.write(web.read)
	end
end
