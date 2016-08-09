# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  erb :'songs/new'
end

get '/signup' do
  erb :'signup/new'
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

post '/songs' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
    )
  @user.save
  redirect '/songs'
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
#   > it needs to verify if the user has signed up
#   > it needs to redirect to back with an error message
#   > it needs to redirect to the songs list page if it works
#   > it needs to have a session id that persists across all pages

# [3] USERS CAN LOGOUT
# I need to create a logout link:
#   > clicking the link should end the user session
#   > clicking the link should redirect them back to login page


# [4] RECORD USER ADDING SONG/TRACK



# [5] USERS CAN UPVOTE SONGS ONCE

# [6] SONGS SHOW UPVOTES, AND ORDERED BY UPVOTES

# [7] USERS CAN LEAVE REVIEWS FOR EACH SONG

# [9] REVIEW RATING
