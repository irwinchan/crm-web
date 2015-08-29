require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :note, Text
end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  @crm_app_name = "My CRM"
  @title = "My CRM - Main Menu"
  @banner_title = "Main Menu"
  erb :index
end

get '/contacts' do
  @title = "My CRM - All Contacts"
  @banner_title = "All Contacts"
  @contacts = Contact.all
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
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :display_contact
  else
    raise Sinatra::NotFound
  end
end

get '/display_contact_attribute' do
  @title = "My CRM - Display Contact Attribute"
  @banner_title = "Display Contact Attribute"
  erb :display_contact_attribute
end

get "/contacts/:id/edit" do
  @title = "My CRM - Edit Contact"
  @banner_title = "Edit Contact"
  @contact = Contact.get(params[:id].to_i)
  erb :modify_contact
end

post '/contacts' do
  contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :note => params[:note]
  )
  redirect to('/contacts')
end

put "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    @contact.update(:first_name => params[:first_name])
    @contact.update(:last_name => params[:last_name])
    @contact.update(:email => params[:email])
    @contact.update(:note => params[:note])

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    @contact.destroy
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end


