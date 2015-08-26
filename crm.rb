require 'sinatra'
require_relative 'rolodex.rb'
require_relative 'contact.rb'

$rolodex = Rolodex.new

get '/' do
  @crm_app_name = "My CRM"
  @title = "My CRM - Main Menu"
  erb :index
end

get '/contacts' do
  @title = "My CRM - All Contacts"
  erb :contacts
end

get '/contacts/new' do
  @title = "My CRM - Create New Contact"
  erb :new_contact
end

# get '/add_contact' do
#   erb :add_contact
# end

get '/modify_contact' do
  @title = "My CRM - Modify Contact"
  erb :modify_contact
end

get '/display_contact' do
  @title = "My CRM - Display Contact"
  erb :display_contact
end

get '/display_contact_attribute' do
  @title = "My CRM - Display Contact Attribute"
  erb :display_contact_attribute
end

get '/delete_contact' do
  @title = "My CRM - Delete Contact"
  erb :delete_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

