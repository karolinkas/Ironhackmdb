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
  validates_length_of :own_comments , :minimum => 10, :maximum => 200, :allow_blank => true

 

	def get_infos	

  #  @supermovies=["Jumanji","The Peanut Butter Solution","Life Aquatic"]
  #  @search_list=[]

	 # @supermovies.each{ |n| @search_list << Imdb::Search.new(n).movies.first.rating }
  #  p search_list
   # [6.8, 6.4, 7.3]

 	end
end








