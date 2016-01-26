# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class ContactsController < ApplicationController
    def index
      user_contacts = User.find(params[:user_id]).contacts
      shared_contacts = User.find(params[:user_id]).shared_contacts
      render json: [user_contacts, shared_contacts]

    end

    def show
      render json: Contact.find(params[:id])
    end

    def create
      contact = Contact.new(contact_params)
      if contact.save
        render json: contact
      else
        render(
        json: contact.errors.full_messages, status: :unprocessable_entity
        )
      end
    end

    def update
      contact = Contact.find(params[:id])
      if contact.update(contact_params)
        render json: contact
      else
        render(
        json: contact.errors.full_messages, status: :unprocessable_entity
        )
      end
    end

    def destroy
      contact = Contact.find(params[:id])
      if contact.delete
        render json: contact
      else
        render(
        json: contact.errors.full_messages, status: :unprocessable_entity
        )
      end
    end


    private

    def contact_params
      params.require(:contact).permit(:name, :email, :user_id)
    end
end
