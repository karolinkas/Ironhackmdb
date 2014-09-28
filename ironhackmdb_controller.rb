require 'sinatra'
require 'sinatra/reloader'
require 'rubygems'
require 'active_record'
require 'imdb'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'ironhackmdb.sqlite'
)

class TVShow < ActiveRecord::Base

	validates_presence_of :name, :own_rating, :own_comments 
  validates_numericality_of :own_rating, greater_than: 0, less_than: 11
  validates_uniqueness_of :name
  validates_length_of :own_comments , :minimum => 10, :maximum => 200 

  def get_info

  # 	dexter_movie = Imdb::Search.new(‘Dexter’).movies.first
		# dexter_serie = Imdb::Serie.new(dexter_movie.id)

  	@movie = Imdb::Search.new(name).movies.first
  	@serie = Imdb::Serie.new(@movie.id)
		#@image_link = @serie.poster # returns the poster URL

  end

  def image_link
  		@serie.poster
  end

end


get '/' do
# is showing information, what the user will receive
# in the index.erb I can only access variables that I define here ( in the get route )
	@all_shows = TVShow.all
	@all_shows.each{|show| show.get_info}
	erb :index

	# binding.pry
end

post '/new' do	
# What the the user is inputing/posting
  newshow = TVShow.new
  newshow.name = params[:name]
  newshow.own_rating = params[:own_rating]
  newshow.own_comments = params[:own_comments]	
  p newshow.save
  p newshow.errors.full_messages

  # binding.pry

	redirect to('/')
end

