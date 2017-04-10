# GET ALL POSTS
get '/posts' do 
  @posts = Post.all
  erb :'posts/index'
end

#NEW POST
get '/posts/new' do
  erb :'posts/new'
end

post '/posts' do 
  @post = Post.new(params[:post])
  if @post.save
    redirect '/'
  else
    @errors = @post.errors.full_messages 
    erb :'posts/new'  # not showing the form
  end
end

# GET ONE POST
get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'posts/show'
end





