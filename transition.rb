require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require 'rake'
require 'shotgun'


get "/" do 
	erb:lafabriq_lapage.erb	
end