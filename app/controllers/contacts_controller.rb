class ContactsController < ApplicationController
  def index
    @contact_form = Contacts.all
  end

  def new
    render layout: 'welcome'
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact_form])

    if @contact.save
      redirect_to root_path
    else
      render 'new'
    end
  end
end
