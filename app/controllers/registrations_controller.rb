class RegistrationsController < ApplicationController


  @posts.as_json(only: [:title, :tag_names], include: { comments: { only: [:body] }})

  def create
    @user = User.new(email: params[:email],
                     username: params[:username],
                     password: params[:password])
    if @user.save
      render json: { user: @user }, status: :created
        # status: 201
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
        # status: 422
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      render json: { user: @user }, status: :ok
    else
      render json: { error: "Could not find user for #{params[:username]} or wrong password." },
        status: :unauthorized
    end
  end

  def destroy
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      @user.destroy
    else
      render json: { error: "Invalid email (#{params[:email]}) or password." },
        status: :unauthorized
    end
  end
end
