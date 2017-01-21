desc "Fetch product prices"
task :fetch_prices => :environment do
  require 'nokogiri'
  require 'open-uri'

  puts "I am getting ran outside"
  Product.all.each do |product|
    puts "I am getting ran inside"
    url = "https://www.walmart.com/search/?query=nest"
    doc = Nokogiri::HTML(open(url))
    puts url
    price = doc.at_css(".price-display").text[/[0-9\.]+/]
    product.update_attribute(:price, price)
    puts price
  end
end
