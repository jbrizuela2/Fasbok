## Gemerar modelo
`rails generate model Post title:string content:text likes:int`

## Migrar base de datos
`rails db:migrate`

## Application record

- Post.create
- Post.all
- Post.count
- Post.first
- Post.last
- p.destroy
- p.update(fields: "asdfasd")
- Post.new
- p.valid?
- p.errors
- p.save
- Post.find(id)
- Post.find_by(title: "salu2")

## Generar PostsController
`rails g controller post`

## Crear recursos de rutas
`resources :posts` dentro de `routes.rb`

## Crar accion en la ruta
## Crear template para la accion

