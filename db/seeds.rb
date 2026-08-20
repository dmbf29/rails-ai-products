if Rails.env.development?
  Product.destroy_all
  Message.destroy_all
  Chat.destroy_all
end

Product.create!(name: "Jeans", description: "A pair of bluejeans.", price: 50)
Product.create!(name: "Slacks", description: "A pair of khaki trousers.", price: 50)
Product.create!(name: "Shorts", description: "A pair of soccer shots.", price: 40)
Product.create!(name: "Shirt", description: "A white shirt with a pocket.", price: 20)
Product.create!(name: "Sweater", description: "A blue wool sweater.", price: 25)
Product.create!(name: "Shoes", description: "A pair of black shoes.", price: 30)
Product.create!(name: "Sandals", description: "A pair of flip flops.", price: 10)
Product.create!(name: "Hat", description: "A baseball cap.", price: 10)
Product.create!(name: "Beanie", description: "A winter hat made of wool.", price: 10)
Product.create!(name: "Chair", description: "A wooden chair.", price: 40)
Product.create!(name: "Table", description: "A metal table.", price: 60)
Product.create!(name: "Artisan Table", description: "A wooden table.", price: 70)
Product.create!(name: "Sofa", description: "A leather sofa.", price: 100)
Product.create!(name: "Loveseat", description: "A two-seater sofa.", price: 90)
Product.create!(name: "Queen Bed", description: "A queen-sized bed.", price: 200)
Product.create!(name: "King Bed", description: "A king-sized bed.", price: 210)
user = User.find_by(email: "doug@lewagon.com")
User.create(email: "doug@lewagon.com", password: "123123") unless user
