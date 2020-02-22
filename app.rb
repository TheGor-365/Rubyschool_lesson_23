#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end

get '/login_form' do
	erb :login_form
end

post '/login_form' do
	@login = param[:login]
	@password = param[:password]

	if @login == 'admin' && @password == '012'
		erb :secret_place
	else
		@message = 'Access denied!'
	end
end

post '/login/attempt' do
	erb :secret_place
end

get '/about' do
	erb :about
end
get '/visit' do
	erb :visit
end
get '/contacts' do
	erb :contacts
end
# get '/secret_place' do
# 	erb :secret_place
# end

post '/visit' do
	@username = params[:username]
	@phome = params[:phone]
	@date_time = params[:date_time]

	@master = params[:master]
	
	@send = params[:send]
	@send_3 = params[:send_3]

	@message = 'Date sended!' if @send
	@message_3 = "Good choice" if @send_3

	visiters = File.open 'public/users.txt', 'a'
	visiters.write "Name: #{@username.capitalize}  phone: #{@phone}  date and time: #{@date_time}  master: #{@master}\n"
	visiters.close

	erb :visit
end

post '/contacts' do
	@email = params[:email]
	@comment = params[:comment]
	@send_2 = params[:send_2]

	@message_2 = "Thanks we'll catch it!" if @send_2

	contacts = File.open 'public/contacts.txt', 'a'
	contacts.write "Email: #{@email}\nComment: #{@comment}\n"
	contacts.close

	erb :contacts
end
