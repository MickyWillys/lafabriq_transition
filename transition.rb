require 'sinatra'
require 'sinatra/activerecord'


# ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
configure :development do
	set :database, 'sqlite:///emailcontact.db'
end

class Prospect < ActiveRecord::Base
end

get "/" do 
	erb :page_transition
end

post "/email" do
	Prospect.create(email: params[:email])
	redirect '/'
end 