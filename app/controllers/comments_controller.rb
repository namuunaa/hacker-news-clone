get '/posts/:post_id/comments/new' do
  @user = current_user
  erb :'comments/_new'
end

post '/posts/:post_id/comments' do
  @user = current_user
  @post = Post.find(params[:post_id])
  @comment = @user.comments.new(params[:comment])
  @comment.post_id = @post.id
  if @comment.save
    redirect "/posts/#{@post.id}"
  else
    @errors = @comment.errors.full_messages
    erb :'comments/_new'
  end
end