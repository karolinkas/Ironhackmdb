require 'sinatra'
require 'sinatra/reloader'
require_relative 'ironhackmdb.rb'

get '/' do
	@all_shows = TVShow.all
	erb :index
end

post '/new' do	
  newshow = TVShow.new
  newshow.name = params[:name]
  newshow.own_rating = params[:own_rating]
  newshow.own_comments = params[:own_comments]	
  newshow.save
	redirect to('/')
end

