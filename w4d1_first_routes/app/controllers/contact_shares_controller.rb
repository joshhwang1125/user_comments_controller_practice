class ContactSharesController < ApplicationController
  
    def create
      contact_shares = ContactShares.new(contact_shares_params)
      if contact_shares.save
        render json: contact_shares
      else
        render(
        json: contact_shares.errors.full_messages, status: :unprocessable_entity
        )
      end
    end



    def destroy
      contact_shares = ContactShares.find(params[:id])
      if contact_shares.delete
        render json: contact_shares
      else
        render(
        json: contact_shares.errors.full_messages, status: :unprocessable_entity
        )
      end
    end


    private

    def contact_shares_params
      params.require(:contact_shares).permit(:contact_id, :user_id)
    end
end
