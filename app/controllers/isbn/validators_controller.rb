class Isbn::ValidatorsController < ApplicationController
  def create
    if(Isbn::Validator.valid?(params['isbn_number']))
      render json: { valid: true, message: 'ISBN number validated with success.' }, status: :ok
    else
      render json: { valid: false, message: 'ISBN number validated without success.' }, status: :ok
    end
  rescue StandardError, ArgumentError
    render json: {}, status: :internal_server_error
  end
end
