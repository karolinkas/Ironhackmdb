require 'rubygems'
require 'active_record'
require 'imdb'
require 'sinatra'
require 'sinatra/reloader'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'ironhackmdb.sqlite'
)


class TVShow < ActiveRecord::Base

	validates_presence_of :name, :own_rating, :own_comments 
  validates_numericality_of :own_rating, greater_than: 0, less_than: 11
  validates_uniqueness_of :name

 

	def get_infos	

  #  @supermovies=["Jumanji","The Peanut Butter Solution","Life Aquatic"]
  #  @search_list=[]

	 # @supermovies.each{ |n| @search_list << Imdb::Search.new(n).movies.first.rating }
  #  p search_list
   # [6.8, 6.4, 7.3]

 	end
end

@tvshow = TVShow.new
@tvshow.save

get '/' do
	@movies = movies
	erb :index
end

post '/new' do
	name = params[:name]
	rating = params[:own_rating]
	own_comments = params[:own_comments]
	
	
end

describe TVShow do 

	describe "name uniqueness" do
		before do
			@tvshow = TVShow.new
			@tvshow.name = "Jumanji"
			@tvshow.own_rating = 3
			@tvshow.own_comments = "I like a little"
			@tvshow.save
		end	

		it "should be not be valid with a duplicated name" do
			@anothertvshow = TVShow.new
			@anothertvshow.name = "Jumanji"
			@anothertvshow.own_rating = 3
			@anothertvshow.own_comments = "I like a little"
			@anothertvshow.valid?.should be_falsy
	  end

	  after do
	  	@tvshow.destroy
	  end
	end

	describe "everything" do
		before do
			@tvshow = TVShow.new
			@tvshow.name = "Jumanji"
			@tvshow.own_rating = 3
			@tvshow.own_comments = "I like a little"
		end

		it "should have all properties" do
			@tvshow.valid?.should be_truthy
		end

		it "should not be a negative number" do
			@tvshow.own_rating = -3
			@tvshow.valid?.should be_falsy
		end

	end



end # end of describe






