require "sinatra"
enable :sessions

get '/' do
	erb :welcome
end