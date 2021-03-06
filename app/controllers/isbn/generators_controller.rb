class Isbn::GeneratorsController < ApplicationController
  def create
    render json: { number: Isbn::Generator.generate(params['isbn_number']),
                   message: 'ISBN number generated with success.' }, status: :ok
  rescue StandardError, ArgumentError
    render json: {}, status: :internal_server_error
  end
end
