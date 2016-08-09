# Homepage (Root path)
def check_login
  @user = User.find_by(id: session[:user_id])
  unless @user
    session[:login_error] = "You need to login! OR sign-up if you're new!"
    redirect '/'
  end
end

get '/' do
  erb :index
end

get '/songs' do
  check_login
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  check_login
  erb :'songs/new'
end

get '/signup' do
  erb :'signup/new'
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end


post '/songs' do
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url: params[:url]
    )
    @song.save
    redirect '/songs'
end

post '/users' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
    )
  @user.save
  redirect '/songs'
end

post '/validate' do
  email = params[:email],
  password = params[:password]

  user = User.find_by(email: email).try(:authenticate, password)
  if user
    session.delete(:login_error) #Login successful, delete login error message
    session[:user_id] = user.id
    redirect '/songs'
  else
    session.delete(:user_id) #just to make sure we've logged out
    session[:login_error] = "You need to login! OR sign-up if you're new!"
    redirect '/'
  end
end



# [1] USERS CAN SIGNUP (email, password)
#
# I need to create a new user table:
#   x with email and password columns
#   x I do this by creating a new migration and migrating it
#   x I would need to update the model with the relationship

# [2] USERS CAN LOGIN
# I need to create a login page:
#   x it needs to have fields for input
#   x it needs to verify if the user has signed up
#   x it needs to redirect to back with an error message
#   x it needs to redirect to the songs list page if it works
#   x it needs to have a session id that persists across all pages

# [3] USERS CAN LOGOUT
# I need to create a logout link:
#   x clicking the link should end the user session
#   x clicking the link should redirect them back to login page


# [4] RECORD USER ADDING SONG/TRACK


# [5] USERS CAN UPVOTE SONGS ONCE

# [6] SONGS SHOW UPVOTES, AND ORDERED BY UPVOTES

# [7] USERS CAN LEAVE REVIEWS FOR EACH SONG

# [9] REVIEW RATING
