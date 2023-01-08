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
    name:"Caneta azul",
    price_in_cents: 100,
    description:"Caneta azul esferógrafica Bic",
    inventory: 50,
    category_id: 1,
    brand_id: 1
)
Product.create!(
    name:"Caneta vermelha",
    price_in_cents: 100,
    description:"Caneta vermelha esferógrafica Bic",
    inventory: 50,
    category_id: 1,
    brand_id: 1
)
Product.create!(
    name:"Apontador 1 furo",
    price_in_cents: 150,
    description:"Apontador 1 furo com depósito Tilibra",
    inventory: 50,
    category_id: 1,
    brand_id: 3
)
Product.create!(
    name:"Borracha b1-2",
    price_in_cents: 150,
    description:"Borracha b1-2 neon pequena Tilibra",
    inventory: 50,
    category_id: 1,
    brand_id: 3
)
Product.create!(
    name:"Ecolápis de cor",
    price_in_cents: 1000,
    description:"Ecolápis de cor 60 cores Faber Castell",
    inventory: 50,
    category_id: 1,
    brand_id: 2
)
Product.create!(
    name:"Ecolápis grafite",
    price_in_cents: 250,
    description:"Kit 3 ecolápis grafite Faber Castell",
    inventory: 50,
    category_id: 1,
    brand_id: 2
)
Product.create!(
    name:"Lapiseira poly",
    price_in_cents: 500,
    description:"Lapiseira poly 0.9mm preta Faber Castell",
    inventory: 50,
    category_id: 1,
    brand_id: 2
)
Product.create!(
    name:"Caderno 10 matérias",
    price_in_cents: 2000,
    description:"Caderno 10 matérias Tilibra",
    inventory: 50,
    category_id: 2,
    brand_id: 3
)
Product.create!(
    name:"Caderno 1 materia",
    price_in_cents: 1000,
    description:"Caderno 1 matérias Tilibra",
    inventory: 50,
    category_id: 2,
    brand_id: 3
)
Product.create!(
    name:"Agenda",
    price_in_cents: 800,
    description:"Agenda costurada Tilibra",
    inventory: 50,
    category_id: 2,
    brand_id: 3
)
Product.create!(
    name:"Caderno universitário 10 materias",
    price_in_cents: 2000,
    description:"Caderno universitário 10 Matérias 160 folhas Bic",
    inventory: 50,
    category_id: 2,
    brand_id: 1
)
Product.create!(
    name:"Caderno universitário 1 materia",
    price_in_cents: 1000,
    description:"Caderno universitário 1 matéria 80 folhas Bic",
    inventory: 50,
    category_id: 2,
    brand_id: 1
)
Product.create!(
    name:"Caderno de anotações",
    price_in_cents: 800,
    description:"Caderno de anotações 80 folhas Bic",
    inventory: 50,
    category_id: 2,
    brand_id: 1
)
Product.create!(
    name:"Mochila anime",
    price_in_cents: 2000,
    description:"Mochila anime preta Faber Castell",
    inventory: 50,
    category_id: 3,
    brand_id: 2
)
Product.create!(
    name:"Mochila de rodinha grande",
    price_in_cents: 2300,
    description:"Mochila de rodinha grande branca Bic",
    inventory: 50,
    category_id: 3,
    brand_id: 1
)
Product.create!(
    name:"Mochila de rodinha pequena",
    price_in_cents: 1800,
    description:"Mochila de rodinha preta pequena Tilibra",
    inventory: 50,
    category_id: 3,
    brand_id: 3
)
Product.create!(
    name:"Mochila de rodinha média",
    price_in_cents: 2000,
    description:"Mochila de rodinha média rosa Bic",
    inventory: 50,
    category_id: 3,
    brand_id: 1
)
Product.create!(
    name:"Mochila",
    price_in_cents: 2000,
    description:"Mochila preta Tilibra",
    inventory: 50,
    category_id: 3,
    brand_id: 3
)
Product.create!(
    name:"Mochila rosa",
    price_in_cents: 2000,
    description:"Mochila rosa Tilibra",
    inventory: 50,
    category_id: 3,
    brand_id: 3
)
Product.create!(
    name:"Mochila lateral",
    price_in_cents: 2000,
    description:"Mochila lateral Faber Castell",
    inventory: 50,
    category_id: 3,
    brand_id: 2
)

Cart.create!(user_id: 2, product_id: 1)

User.find_by(name: 'Admin').profile_picture.attach(io: File.open('./public/admin.png'), filename: 'admin.png')

Product.find_by(name: 'Caneta azul').images.attach(io: File.open('./public/product-1-1.jpg'), filename: 'product-1-1.jpg')
Product.find_by(name: 'Caneta azul').images.attach(io: File.open('./public/product-1-2.jpg'), filename: 'product-1-2.jpg')
