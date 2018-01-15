10.times do |c|
  Category.create(name: "Category #{categories.sample} #{c}").tap do |category|
    10.times do |i|
      name = "item #{items.sample} #{i}"
      category.items.create(
        name: name,
        price: Random.new.rand(100.0).round(2),
        description: "#{name} description")
    end
  end
end