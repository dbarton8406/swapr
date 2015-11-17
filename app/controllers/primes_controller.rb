class PrimesController < ApplicationController
  before_action :authenticate_user!

  def prime
    PrimeJob.perform_later(current_user, params[:count])
    render json: { message: "Job has been queued to compute the #{params[:count]} prime." },
      status: :ok
  end
end
