require 'sinatra'

set :port, 80

get '/' do
  send_file "files/index.html"
end

get '/icon' do
  send_file "files/icon.jpg"
end

get '/about' do
  send_file "files/about.html"
end

get '/contacts' do
  send_file "files/contact.html"
end

get '/args' do
	"Хеш с аргументами: #{params}"
end

get '/login' do
	send_file "files/login.html"
end

post '/login' do
	if params[:login] == "Guest" and params[:password] == "192.168.1.1"
		send_file "files/code_guest.zip"		
	end
	if params[:login] == "Nikita" and params[:password] == "rpiserver.tk" 
		send_file "files/code_Nikita.zip"
	end
	if params[:login] == "Restart" and params[:password] == "185.226.112.104" 
		exec ' sudo pkill -e ruby '
	end
	return "Wrong login data!"
end
# set(:probability) { |value| condition { rand <= value } }

# get '/win_a_car', :probability => 0.1 do
#   "You won!"
# end

# get '/win_a_car' do
#   "Sorry, you lost."
# end