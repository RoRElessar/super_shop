class V1::Admin::AdminController < ApplicationController
  before_action :authenticate_admin_request
  attr_reader :current_admin_user

  private

  def authenticate_admin_request
    @current_admin_user = AuthorizeAdminApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_admin_user
  end
end
