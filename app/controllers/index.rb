require 'pry'

get '/' do
  @date = Time.now.asctime
  @categories = Category.all
  erb :index
end

get '/create' do
  erb :create_post
end

get '/category/:name' do
  @post = Post.find_these(params[:name])
  erb :list_posts
end

get '/post/:name' do
  @view_post = Post.find_by_id(params[:name])
  erb :single_post
end

post '/create_post' do
  @key = Post.create_key
  @new_post = Post.create(title: params[:title],
              description: params[:description],
              price: params[:price],
              email: params[:email],
              category_id: params[:cat_id],
              key: @key)

  erb :created_page
end


get '/post/:id/edit' do
  @key = params[:key]
  @update_post = Post.find_by_key(@key)
  erb :edit_post
end

post '/update_post:id' do
  Post.update_post(params)
  redirect('/')
end
