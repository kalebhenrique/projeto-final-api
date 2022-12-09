User.create!(name:"Trainee", 
    is_admin: true, 
    credit: 100, 
    email:"trainee@gmail", 
    password:"123456")

Category.create!(name:"Materiais")
Category.create!(name:"Cadernos")
Category.create!(name:"Mochilas")