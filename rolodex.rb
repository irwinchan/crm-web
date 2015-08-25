require_relative('contact.rb')

class Rolodex

  @@id = 1000

  def initialize
    @contacts = []
  end

  def add_contact(first_name, last_name, email, note)
    contact = Contact.new(@@id, first_name, last_name, email, note)
    @@id += 1

    @contacts << contact
  end

  def display_contact_by_id(id)
    puts get_contact_by_id(id)
  end

  def get_contact_by_id(id)
    @contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end

    puts "Sorry, there is no record for ID: #{id}"
  end

  def get_key_by_id(id)
    @contacts.each_with_index do |contact, index|
      if contact.id == id
       return index
      end
    end
  end

  def delete_contact_by_id(id)
      @contacts.each_with_index do |contact, index|
      if contact.id == id
        @contacts.delete_at(index)
        return
      end
    end

    puts "Sorry, there is no record for ID: #{id}"
  end

  def modify_first_name_by_id(id, first_name)
    contact = get_contact_by_id(id)
    contact.first_name = first_name
  end

  def modify_last_name_by_id(id, last_name)
    contact = get_contact_by_id(id)
    contact.last_name = last_name
  end

  def modify_email_by_id(id, email)
    contact = get_contact_by_id(id)
    contact.email = email
  end

  def modify_notes_by_id(id, notes)
    contact = get_contact_by_id(id)
    contact.notes = notes
  end

  def display_attribute_first_name
    @contacts.each do |contact|
      puts "#{contact.first_name}"
    end
  end

  def display_attribute_last_name
    @contacts.each do |contact|
      puts "#{contact.last_name}"
    end
  end

  def display_attribute_email
    @contacts.each do |contact|
      puts "#{contact.email}"
    end
  end

  def display_attribute_notes
    @contacts.each do |contact|
      puts "#{contact.email}"
    end
  end

  def all
    @contacts
  end
end