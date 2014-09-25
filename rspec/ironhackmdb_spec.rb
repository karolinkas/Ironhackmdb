require 'rspec'
require_relative '../ironhackmdb.rb'

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