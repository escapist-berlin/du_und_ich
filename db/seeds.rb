require 'roo'

Connection.destroy_all
Phrase.destroy_all
Ad.destroy_all
Subcategory.destroy_all
Category.destroy_all

puts "Creating 600 ads..."
puts ""

adsTable = Roo::Spreadsheet.open('lib/seeds/ads.xlsx')
parsedAds = adsTable.parse(content: 'CONTENT', decade: 'DECADE')

parsedAds.each_with_index do |ad, index|
  puts "The ad # #{index + 1} created ✅"
  Ad.create(
    content: parsedAds[index][:content],
    decade: parsedAds[index][:decade]
  )
end

puts ""
puts "Creating categories & subcategories..."
puts ""

categories = ["Über Mich", "Über Dich", "Ich Suche"]

categories.each_with_index do |category, index|
  puts "The category # #{index + 1} created ✅"
  Category.create(title: category)
end

subcategoriesTable = Roo::Spreadsheet.open('lib/seeds/subcategories.xlsx')
parsedSubcategories = subcategoriesTable.parse(subcategory: 'SUBCATEGORY', category: 'CATEGORY')

parsedSubcategories.each_with_index do |subcategory, index|
  puts "The subcategory # #{index + 1} created ✅"
  Subcategory.create(
    title: subcategory[:subcategory],
    category_id: subcategory[:category]
  )
end
