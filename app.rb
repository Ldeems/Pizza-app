require "sinatra"
enable :sessions

get '/' do
	erb :welcome
end

post '/name' do
	session[:ordername] = params[:ordername]
	redirect '/pick?'
end	

get '/pick' do
	erb :pick
end

post '/pick' do
	session[:delivery] = params[:delivery]
	if session[:delivery] == "house"
		redirect '/del'
	else
		redirect '/placeorder'
	end		
end

get '/del' do
	erb :del
end

post '/del' do
	session[:address] = params[:address]
	redirect '/placeorder'
end

get '/placeorder' do
	
	erb :placeorder
end	

post '/placeorder' do
	
	pric = 0
	session[:size] = params[:size]
	if session[:size] == "featherwieght"
		pric += 10
	elsif session[:size] == "welterwieght"
		pric += 12
	elsif session[:size] == "lightheavywieght"
		pric += 14
	else 
		pric += 16
	end
	if session[:price] == nil
		session[:price] = []
		session[:price]	<< pric
	else
		session[:price] << pric
	end						
	session[:crust] = params[:crust]
	session[:suace] = params[:suace]
	session[:meats] = params[:meats]
	session[:veggies] = params[:veggies]
	session[:cheese] = params[:cheese]
	redirect '/confirm'
end	

get '/confirm' do
	erb :confirm, locals:{meats:session[:meats], veggies:session[:veggies]}
end	

post '/confirm' do
	
	m = params[:meats]
	v = params[:veggies]
	if m == nil

	else	
		session[:meat] = m.values
	end
	if v == nil

	else	
		session[:veggie] = v.values
	end
	redirect '/final'
end	

get '/final' do
	erb :final, locals:{veggie:session[:veggie], meat:session[:meat], cheese:session[:cheese], suace:session[:suace], crust:session[:crust], size:session[:size]}
end	

post '/makeanother' do
	
	hank = params.values
	
	# session[:weird] = []

	if session[:weird] == nil
		session[:weird] = []
	 	session[:weird] << hank.flatten
	else
		session[:weird] << hank.flatten 
	end

	redirect '/placeorder'
end

post '/checkout' do
	pizzas = []
	pizzas << params.values
	session[:pizzas] = pizzas.flatten

	redirect '/results'
end

get '/results' do 
	erb :results, locals:{delivery:session[:delivery], price:session[:price], ordername:session[:ordername], address:session[:address], pizzas:session[:pizzas], weird:session[:weird]}
end	