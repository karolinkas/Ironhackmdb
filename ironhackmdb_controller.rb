require 'sinatra'
require 'sinatra/reloader'
require_relative 'ironhackmdb.rb'

get '/' do
	@tvshow = TVShow.new
	@tvshow.name = 'Friends'
	@tvshow.own_rating = 8
	@tvshow.own_comments = 'I like'
	@tvshow.save
	@all_shows = TVShow.all
	erb :index
end

post '/new' do
	name = params[:name]
	rating = params[:own_rating]
	own_comments = params[:own_comments]
	
end