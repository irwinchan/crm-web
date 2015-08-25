class Contact
  attr_accessor :id, :first_name, :last_name, :email, :notes

  def initialize(id, first_name, last_name, email, notes)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
  end

  def full_name
    first_name + " " + last_name
  end

  def to_s
    "ID: #{@id} \nFirst Name: #{@first_name} \nLast Name: #{@last_name} \nEmail: #{@email} \nNotes: #{@notes}"
  end
end