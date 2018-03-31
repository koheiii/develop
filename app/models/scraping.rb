require 'mechanize'

class Scraping < ApplicationRecord
 def self.get_product
   a = []
   agent = Mechanize.new
   page = agent.get("http://shibuya-o.com/east/schedule/")
   days = page.search('.day')
   days.each do |day|
    a << day.inner_text
   end
   b = []
   agent = Mechanize.new
   page = agent.get("http://shibuya-o.com/east/schedule/")
   bands = page.search('.detail_wrap p')
   bands.each do |ban|
    ban = ban.inner_text
    ban = ban.delete("\n,\r")
    if ban.present?
     b << ban
    end
   end
   c = []
   agent = Mechanize.new
   page = agent.get("http://shibuya-o.com/east/schedule/")
   live_titles = page.search('.open_detail .title')
   live_titles.each do |liv|
    liv = liv.inner_text
    liv = liv.delete("\n,\r")
     c << liv
   end
   a.zip(b,c).each do |day,ban,liv|
   product = Live.new(day: day, band: ban, live_title: liv)
   product.save!
   end
 end

 belongs_to :live
end
