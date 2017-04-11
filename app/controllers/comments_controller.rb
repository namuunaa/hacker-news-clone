get '/posts/:post_id/comments/new' do
  @user = current_user
  erb :'comments/_new'
end

post '/posts/:post_id/comments' do
  if !current_user
    @errors = ['Need to login first']
    erb :'sessions/new'
  else
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
end