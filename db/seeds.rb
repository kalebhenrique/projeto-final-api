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
    price_in_cents: 1600,
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
    name:"Caderno 1 matéria",
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
    name:"Caderno universitário 10 matérias",
    price_in_cents: 2000,
    description:"Caderno universitário 10 Matérias 160 folhas Bic",
    inventory: 50,
    category_id: 2,
    brand_id: 1
)
Product.create!(
    name:"Caderno universitário 1 matéria",
    price_in_cents: 1000,
    description:"Caderno universitário 1 matéria 80 folhas Bic",
    inventory: 50,
    category_id: 2,
    brand_id: 1
)
Product.create!(
    name:"Caderno de anotações",
    price_in_cents: 2999,
    description:"Caderno de anotações 80 folhas Bic",
    inventory: 50,
    category_id: 2,
    brand_id: 1
)
Product.create!(
    name:"Mochila anime",
    price_in_cents: 13000,
    description:"Mochila anime preta Faber Castell",
    inventory: 50,
    category_id: 3,
    brand_id: 2
)
Product.create!(
    name:"Mochila de rodinha grande",
    price_in_cents: 29999,
    description:"Mochila de rodinha grande branca Bic",
    inventory: 50,
    category_id: 3,
    brand_id: 1
)
Product.create!(
    name:"Mochila de rodinha pequena",
    price_in_cents: 20000,
    description:"Mochila de rodinha preta pequena Tilibra",
    inventory: 50,
    category_id: 3,
    brand_id: 3
)
Product.create!(
    name:"Mochila de rodinha média",
    price_in_cents: 23000,
    description:"Mochila de rodinha média rosa Bic",
    inventory: 50,
    category_id: 3,
    brand_id: 1
)
Product.create!(
    name:"Mochila preta",
    price_in_cents: 7000,
    description:"Mochila preta Tilibra",
    inventory: 50,
    category_id: 3,
    brand_id: 3
)
Product.create!(
    name:"Mochila rosa",
    price_in_cents: 6599,
    description:"Mochila rosa Tilibra",
    inventory: 50,
    category_id: 3,
    brand_id: 3
)
Product.create!(
    name:"Mochila lateral",
    price_in_cents: 6599,
    description:"Mochila lateral Faber Castell",
    inventory: 50,
    category_id: 3,
    brand_id: 2
)

Cart.create!(user_id: 2, product_id: 1)

User.find_by(name: 'Admin').profile_picture.attach(io: File.open('./public/admin.png'), filename: 'admin.png')

# images
Product.find_by(name: 'Caneta azul').images.attach(io: File.open('./public/product-1-1.jpg'), filename: 'product-1-1.jpg')
Product.find_by(name: 'Caneta vermelha').images.attach(io: File.open('./public/caneta_vermelha.webp'), filename: 'caneta_vermelha.webp')
Product.find_by(name: 'Apontador 1 furo').images.attach(io: File.open('./public/Apontador.jpg'), filename: 'Apontador.jpg')
Product.find_by(name: 'Borracha b1-2').images.attach(io: File.open('./public/Borracha.jpg'), filename: 'Borracha.jpg')
Product.find_by(name: 'Ecolápis de cor').images.attach(io: File.open('./public/eco_lapis_cor.webp'), filename: 'eco_lapis_cor.webp')
Product.find_by(name: 'Ecolápis grafite').images.attach(io: File.open('./public/eco_grafite.jpg'), filename: 'eco_grafite.jpg')
Product.find_by(name: 'Lapiseira poly').images.attach(io: File.open('./public/lapiseira_poly.webp'), filename: 'lapiseira_poly.webp')
Product.find_by(name: 'Caderno 10 matérias').images.attach(io: File.open('./public/Caderno_10m.jpeg'), filename: 'Caderno_10m.jpeg')
Product.find_by(name: 'Caderno 1 matéria').images.attach(io: File.open('./public/caderno-1.webp'), filename: 'caderno-1.webp')
Product.find_by(name: 'Agenda').images.attach(io: File.open('./public/Agenda.jpg'), filename: 'Agenda.jpg')
Product.find_by(name: 'Caderno universitário 10 matérias').images.attach(io: File.open('./public/caderno-10-u.jpg'), filename: 'caderno-1-u.jpg')
Product.find_by(name: 'Caderno universitário 1 matéria').images.attach(io: File.open('./public/Caderno_u_1m.jpg'), filename: 'Caderno_u_1m.jpg')
Product.find_by(name: 'Caderno de anotações').images.attach(io: File.open('./public/caderno-ano.jpg'), filename: 'caderno-ano.jpg')
Product.find_by(name: 'Mochila anime').images.attach(io: File.open('./public/Mochila_anime.png'), filename: 'Mochila_anime.png')
Product.find_by(name: 'Mochila de rodinha grande').images.attach(io: File.open('./public/Mochila_de_rodinha_p.jpg'), filename: 'Mochila_de_rodinha_p.jpg')
Product.find_by(name: 'Mochila de rodinha pequena').images.attach(io: File.open('./public/Mochila_de_rodinha_r.png'), filename: 'Mochila_de_rodinha_r.png')
Product.find_by(name: 'Mochila de rodinha média').images.attach(io: File.open('./public/Mochila_de_rodinha_b.png'), filename: 'Mochila_de_rodinha_b.png')
Product.find_by(name: 'Mochila preta').images.attach(io: File.open('./public/Mochila_preta.jpg'), filename: 'Mochila_preta.jpg')
Product.find_by(name: 'Mochila rosa').images.attach(io: File.open('./public/Mochila_rosa.jpg'), filename: 'Mochila_rosa.jpg')
Product.find_by(name: 'Mochila lateral').images.attach(io: File.open('./public/Mochila_lateral.jpg'), filename: 'Mochila_lateral.jpg')
