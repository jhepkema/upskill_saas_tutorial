class ContactsController < ApplicationController
  def new
    @contact = Contact.new # This creates a new object when the page is loaded
  end
  
  def create
    @contact = Contact.new(contact_params) # This assigns the contact_params to the Contact.new (the @contact)
    if @contact.save
      flash[:success] = "Message sent."
      redirect_to new_contact_path
    else
      flash[:error] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end