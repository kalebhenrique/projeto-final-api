User.create!(name:"Admin", 
    is_admin: true, 
    credit: 100, 
    email:"trainee@gmail", 
    password:"123456",
    phone:"123456789")

User.create!(name:"User",
    is_admin: false,
    credit: 100,
    email:"user@gmail",
    password:"123456",
    phone:"987654321")

Category.create!(name:"Material Escolar")
Category.create!(name:"Cadernos")
Category.create!(name:"Mochilas")

Brand.create!(name:"Bic")
Brand.create!(name:"Faber Castell")
Brand.create!(name:"Tilibra")

Product.create!(
    name:"Caneta Azul",
    price_in_cents: 100,
    description:"Caneta Azul Esferógrafica Bic",
    inventory: 50,
    category_id: 1,
    brand_id: 1
)
Product.create!(
    name:"Caneta Vermelha",
    price_in_cents: 100,
    description:"Caneta Vermelha Esferógrafica Bic",
    inventory: 50,
    category_id: 1,
    brand_id: 1
)
Product.create!(
    name:"Caderno 10 Matérias",
    price_in_cents: 2000,
    description:"Caderno 10 Matérias Tilibra",
    inventory: 50,
    category_id: 2,
    brand_id: 3
)

Cart.create!(user_id: 2, product_id: 1)
