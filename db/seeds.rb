# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

Store.destroy_all()

for i in (0..14)
    Store.create(
        name: Faker::Company.name,
        inventory: Faker::Number.between(1, 5),
        year_opened: Faker::Number.number(4),
        description: Faker::Company.catch_phrase
    )
end

Store.all().each() {|item|
    for i in (0..5)
        Item.create(
            store_id: item.id,
            name: Faker::Commerce.product_name,
            cost: Faker::Commerce.price
        )
    end
}


Store.all().each_with_index() {|item|
    puts "_____Store #{item.name}_____"
    puts "Description: #{item.description} "
    puts "Opened: #{item.year_opened}"
    puts "inventory: #{item.inventory}"
    puts "Items------"
    item.items.each() {|item|
        puts "Name: #{item.name}"
        puts "Cost: #{item.cost}"
    }

}
