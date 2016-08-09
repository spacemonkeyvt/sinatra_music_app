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

post '/songs' do
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url: params[:url]
    )
    @song.save
    redirect '/songs'
end


# [1] USERS CAN SIGNUP (email, password)
#
# I need to create a new user table:
#   > with email and password columns
#   > I do this by creating a new migration and migrating it
#   > I would need to update the model with the relationship.
#
#   >



# [2] USERS CAN LOGIN

# [3] USERS CAN LOGOUT

# [4] RECORD USER ADDING SONG/TRACK

# [5] USERS CAN UPVOTE SONGS ONCE

# [6] SONGS SHOW UPVOTES, AND ORDERED BY UPVOTES

# [7] USERS CAN LEAVE REVIEWS FOR EACH SONG

# [9] REVIEW RATING
