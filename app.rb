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
	redirect '/confirm?'
end	

get '/confirm' do
	erb :confirm, locals:{meats:session[:meats], veggies:session[:veggies]}
end	

post '/confirm' do
	
	session[:meat] = params[:meats]
	session[:veggie] = params[:veggies]
	redirect '/pick?'
end	

get '/pick' do
	erb :pick, locals:{meat:session[:meat], veggie:session[:veggie]}
end	
