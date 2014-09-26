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

  def get_info(newshow)
  	@serie = Imdb::Serie.new(name).movies.first
		image_link = @serie.poster # returns the poster URL
  end

end


get '/' do

	@all_shows = TVShow.all
	erb :index

	# binding.pry
end

post '/new' do	
  newshow = TVShow.new
  newshow.name = params[:name]
  newshow.own_rating = params[:own_rating]
  newshow.own_comments = params[:own_comments]	
  p newshow.save
  newshow.get_info

  p newshow.errors.full_messages

  # binding.pry

	redirect to('/')
end

