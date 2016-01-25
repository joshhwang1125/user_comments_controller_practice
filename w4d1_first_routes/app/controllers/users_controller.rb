# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime
#  updated_at :datetime
#  username   :string
#

class UsersController < ApplicationController
    def index
      render json: User.all
    end

    def show

      render json: User.find(params[:id])
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: user
      else
        render(
        json: user.errors.full_messages, status: :unprocessable_entity
        )
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render json: @user
      else
        render(
        json: @user.errors.full_messages, status: :unprocessable_entity
        )
      end
    end

    def destroy
      @user = User.find(params[:id])
      if @user.delete
        render json: @user
      else
        render(
        json: @user.errors.full_messages, status: :unprocessable_entity
        )
      end
    end


    private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
