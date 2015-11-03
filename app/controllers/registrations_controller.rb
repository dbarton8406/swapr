class RegistrationsController < ApplicationController

  def create
    @user = User.new(email: params[:email],
                     username: params[:username],
                     password: params[:password])
    if @user.save
      render json: { user: @user.as_json(only: [:id, :email, :username, :access_token]) },
        status: :created
        # status: 201
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
        # status: 422
    end
  end

  def destroy
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      @user.destroy
    else
      render plain: "Go fuck yourself."
    end
  end
end
