require 'sinatra'
require_relative 'rolodex.rb'
require_relative 'contact.rb'

$rolodex = Rolodex.new

# TEST DATA
$rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))
$rolodex.add_contact(Contact.new("Stan", "Lee", "Stan@bitmakerlabs.com", "Stan the man"))
$rolodex.add_contact(Contact.new("Chuck", "Norris", "chuck@bitmakerlabs.com", "karate"))

get '/' do
  @crm_app_name = "My CRM"
  @title = "My CRM - Main Menu"
  @banner_title = "Main Menu"
  erb :index
end

get '/contacts' do
  @title = "My CRM - All Contacts"
   @banner_title = "All Contacts"
  erb :contacts
end

get '/contacts/new' do
  @title = "My CRM - Create New Contact"
  @banner_title = "Create New Contact"
    erb :new_contact
end

get '/contacts/:id' do
  @title = "My CRM - Display Contact"
  @banner_title = "Display Contact"
  @contact = $rolodex.get_contact_by_id(params[:id].to_i)
  if @contact
    erb :display_contact
  else
    raise Sinatra::NotFound
  end
end

get '/modify_contact' do
  @title = "My CRM - Modify Contact"
   @banner_title = "Modify Contact"
  erb :modify_contact
end

get '/display_contact_attribute' do
  @title = "My CRM - Display Contact Attribute"
   @banner_title = "Display Contact Attribute"
  erb :display_contact_attribute
end

get '/delete_contact' do
  @title = "My CRM - Delete Contact"
   @banner_title = "Delete Contact"
  erb :delete_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

