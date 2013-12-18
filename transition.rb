require 'sinatra'
require 'sinatra/activerecord'
require 'active_record'


configure :production do
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end

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