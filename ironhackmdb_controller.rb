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
  TVShow.new
  params[:name]
  params[:own_rating]
  params[:own_comments]	
	redirect to('/')
end

