class WishesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @wish = Wish.find(params[:id])
    render 'show.json.jbuilder'
  end

  def index
    @page = params[:page] || 1
    @wishes = Wish.where(fulfilled: false).per(10).page(@page)
    render 'index.json.jbuilder'
  end

  def create
    @wish = current_user.wishes.new(wish_params)
    if @wish.save
      render 'create.json.jbuilder', status: :created
    else
      render json: { errors: @wish.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def update
    ## TODO
  end

  def destroy
    ## TODO
  end

  private
  def wish_params
    params.require(:wish).permit(:title, :description, :media_type, :fulfilled)
  end
end
