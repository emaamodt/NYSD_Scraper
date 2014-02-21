require 'rubygems'
require 'nokogiri'
require 'open-uri'

BASE_URL = 'http://www.nysd.uscourts.gov/'
LIST_URL = 'http://www.nysd.uscourts.gov/judges/District' #URL for list of judges
page = Nokogiri::HTML(open(LIST_URL)) #opens the judges list

rows = page.css('div.mainblock table.judge_info tr a') #code to select each judge's name

rows.each do |row|
	judge = row.text #prints out each judge's name
	judge_page = Nokogiri::HTML(open("#{BASE_URL}/#{row['href']}"))
	dates =  judge_page.css('div.mainblock table tr td.pdf_list span.pdf_date')
	puts judge 
	puts dates.text
	puts "--------------------------------------"
end