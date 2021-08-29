# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

POSSIBLE_CHARACTERS = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
NUM_TO_GENERATE = 50000

puts "

Generating short urls

"
def generate_short_url
  url = ''
  6.times { url << POSSIBLE_CHARACTERS.sample }
  url
end

short_urls = Set.new

while short_urls.count < NUM_TO_GENERATE
  short_urls << { short_url: generate_short_url }
end

puts "

Populating ShortUrlList

"

short_urls.each_slice(10000) do |urls|
  ShortUrlList.insert_all(short_urls)
end
