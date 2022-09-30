require 'roo'

Connection.destroy_all
Phrase.destroy_all
Ad.destroy_all
Subcategory.destroy_all
Category.destroy_all

xlsx = Roo::Spreadsheet.open('lib/seeds/ads.xlsx')
parsedData = xlsx.parse(content: 'CONTENT', decade: 'DECADE')

puts "Creating 600 ads..."
puts ""

parsedData.each_with_index do |ad, index|
  puts "The ad # #{index + 1} created ✅"
  Ad.create(
    content: parsedData[index][:content],
    decade: parsedData[index][:decade]
  )
end
