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
	redirect '/pick'
end	

get '/confirm' do
	erb :confirm, locals:{meats:session[:meats], veggies:session[:veggies]}
end	

post '/confirm' do
	
	session[:meat] = params[:meats]
	session[:veggie] = params[:veggies]
	redirect '/final'
end	

get '/pick' do
	erb :pick
end

post '/pick' do
	delivery = params[:delivery]
	if delivery == "house"
		redirect '/del'
	else
		redirect '/confirm'
	end		
end

get '/del' do
	erb :del
end

post '/del' do
	session[:address] = params[:address]
	redirect '/confirm'
end	

get '/final' do
erb :final, locals:{address:session[:address], veggie:session[:veggie], meat:session[:meat], cheese:session[:cheese], suace:session[:suace], crust:session[:crust], size:session[:size], ordername:session[:ordername]}
end	