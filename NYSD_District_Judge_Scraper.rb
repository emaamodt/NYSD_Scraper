require 'rubygems'
require 'nokogiri'
require 'open-uri'

BASE_URL = 'http://www.nysd.uscourts.gov/'
LIST_URL = 'http://www.nysd.uscourts.gov/judges/District' #URL for list of judges
page = Nokogiri::HTML(open(LIST_URL)) #opens the judges list
rows = page.css('div.mainblock table.judge_info tr') #code to select each judge's name

rows.each do |row|
	puts row.text #prints out each judge's name
end