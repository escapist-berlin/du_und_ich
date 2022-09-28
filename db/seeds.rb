# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Connection.destroy_all
Phrase.destroy_all
Ad.destroy_all
Subcategory.destroy_all
Category.destroy_all

# Creating one category, one subcategory, one phrase and one ad.

über_mich = Category.create(title: "Über Mich")

alter1 = Subcategory.new(title: "Alter")
alter1.category = über_mich
alter1.save!

phrase1 = Phrase.new(title: "trotz 27 noch jung")
phrase1.subcategory = alter1
phrase1.save!

ad1 = Ad.create(
  content: "Stuttgart. Langhaariger Rockfan, links, trotz 27 noch jung, sucht Langhaarboy, 18 bis 25, für ernsthafte und trotzdem lustige Dauerfreundschatt. Bildzuschritten.",
  decade: "1970's"
)

connection1 = Connection.create(phrase: phrase1, ad: ad1)

# korpertyp1 = Subcategory.new(title: "Körpertyp")
# korpertyp1.category = über_mich
# korpertyp1.save!

# charakter1 = Subcategory.new(title: "Charakter")
# charakter1.category = über_mich
# charakter1.save!

# ethnie1 = Subcategory.new(title: "Ethnie")
# ethnie1.category = über_mich
# ethnie1.save!

# tribes1 = Subcategory.new(title: "Tribes")
# tribes1.category = über_mich
# tribes1.save!

# position1 = Subcategory.new(title: "Position")
# position1.category = über_mich
# position1.save!

# hobbies1 = Subcategory.new(title: "Hobbies")
# hobbies1.category = über_mich
# hobbies1.save!

# jobbezeichnung1 = Subcategory.new(title: "Jobbezeichnung")
# jobbezeichnung1.category = über_mich
# jobbezeichnung1.save!

# klasse1 = Subcategory.new(title: "Klasse")
# klasse1.category = über_mich
# klasse1.save!



# über_dich = Category.create(title: "Über Dich")
# ich_suche = Category.create(title: "Ich Suche")
