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

end












