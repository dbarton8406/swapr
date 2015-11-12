class GrantsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    @wish = Wish.find(params[:wish_id])
    @grant = @wish.grants.new(user_id: current_user.id,
                              gift: params[:upload],
                              details: params[:details])
    if @grant.save
      render :create, status: :created
    else
      render json: { errors: @grant.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def index
    @wish = Wish.find(params[:wish_id])
    @grants = @wish.grants
    render :index, status: :ok
  end

  def destroy
    @grant = Grant.find(params[:grant_id])
    if @grant.user_id == current_user.id
      @grant.destroy
      head :no_content
    else
      render json: { error: "This grant does not belong to you, so you can't delete it!" },
        status: :forbidden
    end
  end

  def show
    @grant = Grant.find(params[:id])
    render :show
  end
end
