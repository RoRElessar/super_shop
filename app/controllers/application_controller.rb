class ApplicationController < ActionController::API
  before_action :authenticate_request, :set_cart
  attr_reader :current_user

  def set_cart
    @cart = current_cart
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def current_cart
    Cart.find(session[request.host_with_port]['cart_id']) # TODO: change session to something else
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[request.host_with_port]['cart_id'] = cart.id # TODO: change session to something else
    cart
  end
end
