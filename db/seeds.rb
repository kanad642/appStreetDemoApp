product = Product.create!(name: "Samsung Galaxy A8+", description: "Resplendent in metal and glass, it’s thoughtfully designed", image: 'https://assignment-appstreet.herokuapp.com/sam_1.5gb_black_1.jpg', price: "30000", discounted_price: "27000")
product = Product.create!(name: "Samsung Galaxy A8+", description: "Resplendent in metal and glass, it’s thoughtfully designed", image: 'https://assignment-appstreet.herokuapp.com/sam_1.5gb_black_1.jpg', price: "30000", discounted_price: "27000")



product.option_types.create!(name: "Storage").tap do |size|
  %W(1.5GB 2GB 4GB).each do |name|
    size.option_values.create!(name: name)
  end
end

product.option_types.create!(name: "Color").tap do |color|
  %W(Red Blue Orange).each do |name|
    color.option_values.create!(name: name)
  end
end

gb =product.option_types.find_by(name: "Storage").option_values.find_by(name: "1.5GB")
red =product.option_types.find_by(name: "Color").option_values.find_by(name: "Red")


product.variants.create!(option_values: [gb, red], price: 1200.95)



storage = OptionValue.where(name: "1.5GB").last
red = OptionValue.where(name: "Red").last
chosen_option_value_ids = [storage.id, red.id]
variant = Product.last.variants.joins(:option_values).where(option_values: { id: chosen_option_value_ids }).group(:id).having("count(variants.id) = ?", chosen_option_value_ids.count).first