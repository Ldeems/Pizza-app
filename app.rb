require "sinatra"
enable :sessions

get '/' do
	erb :welcome
end

post '/name' do
	session[:ordername] = params[:ordername]
	redirect '/placeorder?'
end	

get '/placeorder' do
	p "#{session[:ordername]} look here"
	erb :placeorder
end	