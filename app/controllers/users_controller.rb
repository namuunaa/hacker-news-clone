# NEW USER CREATE ACCOUNT
get '/users/new' do 
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login_user
    redirect '/' #later need to redirect to new post page
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

# USER PROFILE
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

# USER SUBMISSIONS
get '/users/:user_id/posts' do
  @user = User.find(params[:user_id])
  @posts = @user.posts
  erb :'posts/index'
end

# USER COMMENTS
get '/users/:user_id/comments' do
  @user = User.find(params[:user_id])
  @comments = @user.comments
  erb :'comments/index'
end