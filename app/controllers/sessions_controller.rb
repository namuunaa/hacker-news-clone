get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:username], params[:password])
    login_user
  else
    @errors = ["You done goofed. ur email or password is incorrect"]
    erb :'sessions/new'
  end
end

delete '/sessions' do
  logout_user
end
