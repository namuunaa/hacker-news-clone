get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:username], params[:password])
    login_user
  else
    @errors = ["The email or password is incorrect."]  #error message not showing up
    erb :'sessions/new'
  end
end

delete '/sessions' do
  logout_user
end
