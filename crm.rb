require 'sinatra'
require_relative 'rolodex.rb'
require_relative 'contact.rb'

$rolodex = Rolodex.new

get '/' do
  @crm_app_name = "My CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

# get '/add_contact' do
#   erb :add_contact
# end

get '/modify_contact' do
  erb :modify_contact
end

get '/display_contact' do
  erb :display_contact
end

get '/display_contact_attribute' do
  erb :display_contact_attribute
end

get '/delete_contact' do
  erb :delete_contact
end


