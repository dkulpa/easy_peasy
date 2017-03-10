require 'json'

HASH = [{
  first_name: 'Bruce',
  last_name: 'Wayne',
  nickname: 'Batman',
},
  {
    first_name: 'Hal',
    last_name: 'Wayne',
    nickname: 'Green Lantern',
  }
]

ITEMS = [
  ['Batrang', 'Grapling Hook', 'Batmobile', 'Utility belt'],
  ['Ring of Will', 'Lantern']
]
hash = HASH
items = ITEMS

def hash_to_json(hash)
  hash.to_json
end

puts "Hash to json: #{hash_to_json(hash)}"

file = File.read('input.json')
data_hash = JSON.parse(file)

def merge_equipment(data_hash, items)
  data_hash['data']['hero'].each_with_index do |hero, index|
    hero.merge!({
      'equipment': {
        item: items[index]
      }
    })
  end
end

merge_equipment(data_hash, items)
p "Merged hash: #{data_hash}"

