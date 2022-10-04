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

puts ""
puts "Creating phrases..."
puts ""

phrasesTable = Roo::Spreadsheet.open('lib/seeds/phrases.xlsx')
parsedPhrases = phrasesTable.parse(phrase: 'PHRASE', subcategory: 'SUBCATEGORY')

parsedPhrases.each_with_index do |phrase, index|
  puts "The phrase # #{index + 1} created ✅"
  Phrase.create(
    title: phrase[:phrase],
    subcategory_id: phrase[:subcategory]
  )
end

puts ""
puts "Creating connections..."
puts ""

parsedConnections = phrasesTable.parse(id: 'ID', ads: 'ADS')
connectionCount = 0

parsedConnections.each do |connection|

  # If there are several ads with this phrase,
  # make an array of ads nums and iterate through it

  if connection[:ads].class == String

    adIds = connection[:ads].split(", ").map(&:to_i)
    adIds.each do |id|
      Connection.create(
        phrase_id: connection[:id],
        ad_id: id
      )

      connectionCount += 1
      puts "The connection # #{connectionCount} created ✅"
    end

  else

    Connection.create(
      phrase_id: connection[:id],
      ad_id: connection[:ads]
    )

    connectionCount += 1
    puts "The connection # #{connectionCount} created ✅"
  end

end
