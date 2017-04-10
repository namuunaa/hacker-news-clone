get '/posts/:post_id/comments/new' do
  @post = Post.find(params[:post_id])
  @comment = Comment.new(post_id: @post.id)
  erb :'comments/_new'
end

post '/posts/:post_id/comments' do
  @post = Post.find(params[:post_id])
  @comment = Comment.new(params[:comment])
  if @comment.save
    redirect "/posts/#{@post.id}"
  else
    @errors = @comment.errors.full_messages
    erb :'comments/_new'
  end
end