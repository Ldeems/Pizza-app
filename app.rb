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
	
	erb :placeorder
end	

post '/placeorder' do
	session[:size] = params[:size]
	session[:crust] = params[:crust]
	session[:suace] = params[:suace]
	session[:meats] = params[:meats]
	session[:veggies] = params[:veggies]
	session[:cheese] = params[:cheese]
	
end	
